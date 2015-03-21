/*
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 *
 *   First version:  Johan Boye, 2010
 *   Second version: Johan Boye, 2012
 *   Additions: Hedvig Kjellström, 2012-14
 */


package src;

import java.io.*;
import java.util.*;

/**
 *   Implements an inverted index as a Hashtable from words to PostingsLists.
 */
public class HashedIndex extends src.Index {

    /** The index as a hashtable. */
    private HashMap<String, src.PostingsList> index = new HashMap<String, src.PostingsList>();

    /** Document norms */
    private HashMap<Integer, Double> docNorm = new HashMap<Integer, Double>();

    /** Tree containing the 10% most popular postingslist sorted by popularity */
    private TreeSet<src.PostingsList> popularitySet = new TreeSet<src.PostingsList>();
    private Iterator<src.PostingsList> popularityIterator;
    private src.PageRank pageranks;
    private int popularityIteratorIdx = -1;
    private int docElapsed = 0;
    private int doc_counter = 0;
    private int requests_counter = 0;
    private static final String POPULARITY_FILE_NAME = "tree_set";
    private static final String DOCUMENT_ID_FILE_NAME = "doc_id_map";
    private static final String INDEX_FILE_NAME = "global_index_map";
    private static final String DOCUMENT_LENGTH_FILE_NAME = "doc_length_map";
    private static final String PAGERANKS_FILE_NAME = "map_page_ranks";
    private int word_threshold;

    private static final boolean CACHE = false;
    private static final boolean CLEAN_CACHE = false;
    private static final boolean GLOBAL_CACHE = false;
    private static final String CACHE_PATH = "./cache/";

    private static final int TF_IDF_WEIGHT = 1;
    private static final int PAGERANK_WEIGHT = 30;

    /** Each X documents, words below popularity threshold (Y %) are removed from memory */
    private static final int DOC_ELAPSED_THRESHOLD = 1000; //1000 docs
    /** Percentage of words kept in memory */
    private static final int WORD_MEMORY_THRESHOLD = 0; //1%
    /** Minimum number of words always in memory (used while indexing until the percentage above gets higher) */
    private static final int MIN_WORD_MEMORY = 10; //1000
    /** The unpopular tokens (after the word threshold) are removed every N queries */
    private static final int REQUESTS_BEFORE_CLEANING = 3;

    /** Relevance feedback */
    private static final boolean UNINVERTED_INDEX = true;

    /** Uninverted index
     * - Key: document ID
     * - Value: Hashmap:
     *      - Key: word
     *      - Value: Frequency in the current document
     */
    HashMap<Integer, HashMap<String, Integer>> uninverted_index = new HashMap<Integer, HashMap<String, Integer>>();
    private int tmpUninvertedDocID = -1;
    private HashMap<String, Integer> tmpUninvertedDoc = null;

    /**
     *  Inserts this token in the index.
     */
    public void insert( String token, int docID, int offset ) {
        src.PostingsList ps = index.get(token);
        if(ps == null) {
            ps = new src.PostingsList(token);
            index.put(token, ps);
            popularitySet.add(ps);
        } else if(!GLOBAL_CACHE) {
            popularitySet.remove(ps);
            ps.increasePopularity();
            popularitySet.add(ps);
        }

        ps.addToken(docID, offset, null);

        insert_uninverted(token, docID);
    }

    public void insert_uninverted(String token, int docID) {
        if(UNINVERTED_INDEX) {
            HashMap<String, Integer> doc;

            if(docID == tmpUninvertedDocID) {
                doc = tmpUninvertedDoc;
            } else {
                doc = uninverted_index.get(docID);
                if(doc == null) {
                    doc = new HashMap<String, Integer>();
                    uninverted_index.put(docID, doc);
                }
                tmpUninvertedDoc = doc;
                tmpUninvertedDocID = docID;
            }

            Integer count = doc.get(token);
            if (count == null) {
                doc.put(token, 1);
            } else {
                doc.put(token, count+1);
            }
        }
    }


    /**
     *  Returns all the words in the index.
     */
    public Iterator<String> getDictionary() {
        return index.keySet().iterator();
    }


    /**
     *  Returns the postings for a specific term, or null
     *  if the term is not in the index.
     */
    public src.PostingsList getPostings( String token ) {
        return index.get(token);
    }

    private List<Integer> getSentencePositions(List<ListIterator<Integer>> offsetIterators) {
        List<Integer> positions = new LinkedList<Integer>();
        // Iterator on the lists of offsets
        Iterator<ListIterator<Integer>> offsetIterIterator = offsetIterators.iterator();
        ListIterator<Integer> pp0 = offsetIterIterator.next(), pp2;
        int tmp0, tmp1, tmp2;
        boolean sentence;

        // For each offset of the first list
        while(pp0.hasNext()) {
            tmp0 = pp0.next();
            tmp1 = tmp0;
            sentence = true;

            // For every other list of offsets, we check if if contains an offset following the previous one
            while (offsetIterIterator.hasNext()) {
                pp2 = offsetIterIterator.next();

                // While the current offset is lower than the previous one
                while (pp2.hasNext() && pp2.next() < tmp1) ;
                tmp2 = pp2.previous();
                // If the second word is not exactly after the previous one
                if (tmp2 != tmp1 + 1) {
                    // The previous word position cannot lead to a sentence, we jump to the next one
                    sentence = false;
                    break;
                }
                // The second word follows the previous one, we try the others
                pp2.next();
                tmp1 = tmp2;
            }

            // The document contains the right sentence
            if (sentence)
                positions.add(tmp0);

            // Position the list iterator on the first list of offsets
            offsetIterIterator = offsetIterators.iterator();
            // The first iterator is already known
            offsetIterIterator.next();
        }

        return positions;
    }

    private src.PostingsList getIntersectionPostings(List<String> tokens, int queryType) {
        src.PostingsList result = new src.PostingsList();
        // For each token, a list of documents (a document is a PostingsEntry containing a list of offsets)
        LinkedList<ListIterator<src.PostingsEntry>> docsIterators = new LinkedList<ListIterator<src.PostingsEntry>>();
        LinkedList<src.PostingsList> tokensPostings = new LinkedList<src.PostingsList>();
        int maxDocID, nlists = 0, tmp;
        int[] wordFrequencies = new int[tokens.size()];

        // Postings retrieval
        for(String t : tokens) {
            src.PostingsList postings = getPostings(t);
            if(postings == null) {
                return null;
            }
            tokensPostings.add(postings);
            docsIterators.add(postings.postingsEntriesIterator());
        }

        // We start with the smallest list (heuristic)
        if(queryType == src.Index.INTERSECTION_QUERY) {
            Collections.sort(tokensPostings, new Comparator<src.PostingsList>(){
                public int compare(src.PostingsList a1, src.PostingsList a2) {
                    return a2.size() - a1.size(); // assuming you want biggest to smallest
                }
            });
            docsIterators.clear();
            for(src.PostingsList postings : tokensPostings) {
                docsIterators.add(postings.postingsEntriesIterator());
            }
        }

        // While none of the lists have been completely explored
        while(true) {
            // We find the list having the bigger docID among the current iterators
            maxDocID = Integer.MIN_VALUE;
            for(ListIterator<src.PostingsEntry> iter : docsIterators) {
                if(!iter.hasNext()) {
                    return result;
                }

                tmp = iter.next().docID;
                //We reset the number of iterators positioned at maxDocID
                if(tmp > maxDocID) {
                    maxDocID = tmp;
                    nlists = 1;
                //We increment the number of iterators positioned at maxDocID
                } else if (tmp == maxDocID) {
                    ++nlists;
                }
            }

            // Every iterator point on the same document ID
            if(nlists == tokens.size()) {
                // Intersection query
                if(queryType == src.Index.INTERSECTION_QUERY) {
                    result.addToken(maxDocID, -1, null);

                // Phrase query
                } else if(queryType == src.Index.PHRASE_QUERY) {
                    LinkedList<ListIterator<Integer>> offsetIterators = new LinkedList<ListIterator<Integer>>();
                    // For each documents iterator (one per token)
                    for(ListIterator<src.PostingsEntry> iter : docsIterators) {
                        // Add to the list an iterator on the list of offset for a given token and document
                        offsetIterators.add(iter.previous().listIterator());
                        iter.next();
                    }
                    // Retrieve for the given document the starting position of the sentences
                    List<Integer> positions = getSentencePositions(offsetIterators);
                    // If the document contains at least one sentence (
                    if(!positions.isEmpty()) {
                        // It is a result
                        result.addToken(maxDocID, -1, null);
                    }
                }
            } else {
                // For every other list
                for(ListIterator<src.PostingsEntry> iter : docsIterators) {
                    if(iter.previous().docID != maxDocID) {
                        iter.next();
                        // We iterate until we reach a docID higher or equal, or the end of the list
                        while(iter.hasNext() && iter.next().docID < maxDocID);
                        if(iter.previous().docID < maxDocID) {
                            return result;
                        }
                    }
                }
            }
        }
    }

    /**
     *  Searches the index for postings matching the query.
     */
    public src.PostingsList search( src.Query query, int queryType, int rankingType, int structureType ) {
        if(!loadTokens(query.terms)) {
            return null;
        }

        src.PostingsList ps = null;

        if(query.size() > 0) {
            if(queryType == src.Index.INTERSECTION_QUERY || queryType == src.Index.PHRASE_QUERY) {
                ps = getIntersectionPostings(query.terms, queryType);
            }
            else if(queryType == src.Index.RANKED_QUERY) {
                ps = getRankedPostings(query.terms, rankingType, query);
            }
        }
        else {
            return null;
        }

        ++requests_counter;

        // Cleaning unpopular entries
        if(CACHE && requests_counter == REQUESTS_BEFORE_CLEANING) {
            requests_counter = 0;

            Iterator<src.PostingsList> iter = popularitySet.descendingIterator();
            int i = 0, threshold = word_threshold;

            while(i < threshold && iter.hasNext()) {
                iter.next();
                ++i;
            }
            i = 0;
            if(iter.hasNext()) {
                src.PostingsList tmp = iter.next();
                while(!tmp.postingsEntries.isEmpty() && iter.hasNext()) {
                    ++i;
                    tmp.postingsEntries.clear();
                    tmp = iter.next();
                }
            }
            System.out.println(String.format("%d tokens removed from memory.", i, popularitySet.size()-i));
        }

        return ps;
    }

    /**
     * Save the words populatity
     */
    public void cleanup() {
        if(GLOBAL_CACHE) {
            exportGlobalIndex();
        } else if(CACHE) {
            exportPopularitySet();
        }
    }

    /* ----------------------------------------------- */
    /*                    RANKING                      */
    /* ----------------------------------------------- */
    private void computeDocumentNorms() {
        System.out.println("Computing document norms...");
        for(src.PostingsList ps2 : index.values()) {
            for(src.PostingsEntry pe : ps2.postingsEntries) {
                Double score = docNorm.get(pe.docID);
                if(score == null) {
                    score = 0.0;
                }
                score += pe.score * Math.log10(index.size() / (double) ps2.postingsEntries.size());
                docNorm.put(pe.docID, score);
            }
        }
        System.out.println("Done");
    }

    private src.PostingsList getRankedPostings(List<String> tokens, int rankingType, src.Query query) {
        int tokenIdx = 0;
        double tfidfScore, cos_sim;
        src.Vector queryVector = null;
        HashMap<Integer, src.Vector> docVectors = null;
        src.PostingsList ps;
        src.PostingsEntry pe;
        TreeSet<src.PostingsEntry> pagerankedDocs = null;
        src.PostingsEntry[] docArray;

        Set<String> uniqueTokens = new TreeSet<String>();
        uniqueTokens.addAll(tokens);
        tokens.clear();
        tokens.addAll(uniqueTokens);

        if(rankingType != src.Index.PAGERANK) {
            // Query vector
            if(query.vector == null) {
                queryVector = src.Vector.ones(tokens.size());
                queryVector.normalize();
            } else {
                queryVector = query.vector;
            }
            docVectors = new HashMap<Integer, src.Vector>();
        } else {
            // Prepare the set structure to guarantee that every document ID in the set is unique
            pagerankedDocs = new TreeSet<src.PostingsEntry>(new Comparator<src.PostingsEntry>(){
                public int compare(src.PostingsEntry a1, src.PostingsEntry a2) {
                    return a2.docID - a1.docID; // assuming you want biggest to smallest
                }
            });
        }

        // Compute the TF-IDF vectors for each document
        for(String token : tokens) {
            src.PostingsList tokenPostings = getPostings(token);
            for(src.PostingsEntry entry : tokenPostings.postingsEntries) {
                if(rankingType != src.Index.PAGERANK) {
                    src.Vector v = docVectors.get(entry.docID);
                    if (v == null) {
                        v = new src.Vector(tokens.size());
                        docVectors.put(entry.docID, v);
                    }

                    // Update the TF-IDF score of one term for one document
                    tfidfScore = entry.score * Math.log10(index.size() / (double) tokenPostings.postingsEntries.size());
                    // / super.docLengths.get("" + entry.docID)
                    v.set(tokenIdx, tfidfScore);
                } else {
                    pe = new src.PostingsEntry(entry.docID);
                    // Get the document pagerank
                    pe.score = pageranks.get("" + entry.docID);
                    // Add the current document if it does not exist to the list of documents
                    pagerankedDocs.add(pe);
                }
            }
            ++tokenIdx;
        }

        if(rankingType != src.Index.PAGERANK) {
            // Compute the cosine similarity score of each document
            docArray = new src.PostingsEntry[docVectors.size()];
            int i = 0;
            Iterator<Map.Entry<Integer, src.Vector>> iter = docVectors.entrySet().iterator();

            while (iter.hasNext()) {
                Map.Entry pair = iter.next();
                pe = new src.PostingsEntry((Integer) pair.getKey());
                //((src.Vector)pair.getValue()).normalize();

                ((src.Vector) pair.getValue()).divide(docNorm.get((Integer) pair.getKey()));

                cos_sim = queryVector.cosineSimilarity((src.Vector) pair.getValue());

                if (rankingType == src.Index.TF_IDF) {
                    pe.score = cos_sim;
                } else if (rankingType == src.Index.COMBINATION) {
                    pe.score = cos_sim * TF_IDF_WEIGHT + pageranks.get("" + pe.docID) * PAGERANK_WEIGHT;
                }
                docArray[i] = pe;
                ++i;
            }
        } else {
            docArray = pagerankedDocs.toArray(new src.PostingsEntry[pagerankedDocs.size()]);
        }

        // Sort the results
        Arrays.sort(docArray);
        ps = new src.PostingsList();
        for(src.PostingsEntry tmp : docArray) {
            ps.postingsEntries.add(tmp);
        }

        return ps;
    }


    /* ----------------------------------------------- */
    /*                     CACHE                       */
    /* ----------------------------------------------- */

    public void nextDoc() {
        ++docElapsed;
        if(docElapsed == DOC_ELAPSED_THRESHOLD && CACHE && !GLOBAL_CACHE) {
            ++doc_counter;
            System.out.println(String.format("%d documents indexed", doc_counter*DOC_ELAPSED_THRESHOLD));
            indexingThresholdReached();
            docElapsed = 0;
        }
    }

    private void updatePostingsFile(src.PostingsList ps) {
        File f = new File(CACHE_PATH + ps.token);
        // Merge the existing postings list with the one on the disk
        if(f.exists()) {
            src.PostingsList tmp = new src.PostingsList();
            try {
                // Read the existing postings list from the disk
                ObjectInputStream input = new ObjectInputStream(new FileInputStream(f));
                tmp.postingsEntries = (LinkedList<src.PostingsEntry>) input.readObject();
                input.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            // Merge the two postings list
            for(src.PostingsEntry pe : ps.postingsEntries) {
                tmp.addToken(pe.docID, -1, pe);
            }
            ps.postingsEntries = tmp.postingsEntries;
        }
        // Write the postings list on the disk
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(f));
            oos.writeObject(ps.postingsEntries);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void indexingThresholdReached() {
        updateWordThreshold();
        src.PostingsList ps = getNextUnpopularPostingsList();
        while(ps != null && !ps.postingsEntries.isEmpty()) {
            updatePostingsFile(ps);
            // Clear memory
            ps.clear();
            ps = getNextUnpopularPostingsList();
        }
    }

    private void exportGlobalIndex() {
        System.out.println("Exporting global index...");
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(CACHE_PATH + INDEX_FILE_NAME));
            oos.writeObject(index);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void exportDocumentsLength() {
        System.out.println("Exporting documents length...");
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(CACHE_PATH + DOCUMENT_LENGTH_FILE_NAME));
            oos.writeObject(super.docLengths);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void exportDocumentIDs() {
        System.out.println("Exporting documents ID...");
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(CACHE_PATH + DOCUMENT_ID_FILE_NAME));
            oos.writeObject(super.docIDs);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void exportPopularitySet() {
        System.out.println("Exporting popularity set...");
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(CACHE_PATH + POPULARITY_FILE_NAME));
            oos.writeObject(popularitySet);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Insert in the map the words required by the query and update their popularity
    private boolean loadTokens(LinkedList<String> tokens) {
        for(String token : tokens) {
            src.PostingsList ps = index.get(token);

            if(ps == null) {
                return false;
            }

            if(ps.postingsEntries.isEmpty()) {
                try {
                    ObjectInputStream input = new ObjectInputStream(
                            new FileInputStream(new File(CACHE_PATH + ps.token)));
                    ps.postingsEntries = (LinkedList<src.PostingsEntry>) input.readObject();
                    input.close();
                } catch(Exception e) {
                    //The file does not exist
                    return false;
                }
                System.out.println("Entries of token '" + token + "' imported");
            }

            popularitySet.remove(ps);
            ps.increasePopularity();
            popularitySet.add(ps);
        }
        return true;
    }

    private void cleanCache() {
        File dir = new File(CACHE_PATH);
        File[] files = dir.listFiles();
        if(files != null) {
            for (File file : files) file.delete();
        }
        System.out.println("Cache cleaned");
    }

    public boolean importIndex() {
        this.pageranks = src.PageRank.import_(CACHE_PATH + PAGERANKS_FILE_NAME);
        if(this.pageranks == null) {
            this.pageranks = new src.PageRank();
            src.PageRank.export(this.pageranks, CACHE_PATH + PAGERANKS_FILE_NAME);
        }

        if(!CACHE) {
            return false;
        }

        if(CLEAN_CACHE) {
            cleanCache();
        }
        if(GLOBAL_CACHE) {
            return importGlobalIndex() && importDocumentIDs()  && importDocumentsLength();
        }
        if(CACHE && !existCache()) {
            cleanCache();
            return false;
        }

        importDocumentIDs();
        importDocumentsLength();
        importPopularitySet();

        Iterator<src.PostingsList> iter;
        int i = 0;

        if(popularitySet.descendingIterator().next().getPopularity() == 0) {
            iter = popularitySet.iterator();
        } else {
            iter = popularitySet.descendingIterator();
        }

        // Import the postings list of the most popular words
        while(i < word_threshold && iter.hasNext()) {
            src.PostingsList ps = iter.next();
            try {
                ObjectInputStream input = new ObjectInputStream(
                        new FileInputStream(new File(CACHE_PATH + ps.token)));
                ps.postingsEntries = (LinkedList<src.PostingsEntry>) input.readObject();
                input.close();
            } catch (Exception e) {
                cleanCache();
                return false;
            }
            index.put(ps.token, ps);
            ++i;
        }

        // Add the other words in the map with empty postings lists
        while(iter.hasNext()) {
            src.PostingsList ps = iter.next();
            ps.postingsEntries = new LinkedList<src.PostingsEntry>();
            index.put(ps.token, ps);
        }

        popularitySet.clear();
        popularitySet.addAll(index.values());

        System.out.println("Index imported");

        return true;
    }

    private void importPopularitySet() {
        try {
            ObjectInputStream input = new ObjectInputStream(
                    new FileInputStream(new File(CACHE_PATH + POPULARITY_FILE_NAME)));
            popularitySet = (TreeSet<src.PostingsList>) input.readObject();
            input.close();
            updateWordThreshold();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateWordThreshold() {
        word_threshold = Math.max((int)(popularitySet.size() * WORD_MEMORY_THRESHOLD / 100.0), MIN_WORD_MEMORY);
    }

    private boolean importGlobalIndex() {
        try {
            ObjectInputStream input = new ObjectInputStream(
                    new FileInputStream(new File(CACHE_PATH + INDEX_FILE_NAME)));
            index = (HashMap<String, src.PostingsList>) input.readObject();
            input.close();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    private boolean importDocumentsLength() {
        try {
            ObjectInputStream input = new ObjectInputStream(
                    new FileInputStream(new File(CACHE_PATH + DOCUMENT_LENGTH_FILE_NAME)));
            super.docLengths = (HashMap<String, Integer>) input.readObject();
            input.close();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    private boolean importDocumentIDs() {
        try {
            ObjectInputStream input = new ObjectInputStream(
                    new FileInputStream(new File(CACHE_PATH + DOCUMENT_ID_FILE_NAME)));
            super.docIDs = (HashMap<String, String>) input.readObject();
            input.close();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    private void updateEntryScores() {
        for(src.PostingsList ps : index.values()) {
            for(src.PostingsEntry pe : ps.postingsEntries) {
                pe.score /= super.docLengths.get("" + pe.docID);
            }
        }
    }

    public void indexingOver() {
        updateEntryScores();
        computeDocumentNorms();

        if(!CACHE) {
            return;
        }
        System.out.println(String.format("%d documents indexed\nIndexing over. Saving entries...", doc_counter*DOC_ELAPSED_THRESHOLD+docElapsed));

        if(GLOBAL_CACHE) {
            exportDocumentIDs();
            exportDocumentsLength();
            exportGlobalIndex();
            return;
        }

        Iterator<src.PostingsList> iter = popularitySet.descendingIterator();
        int i = 1;
        updateWordThreshold();

        src.PostingsList ps = iter.next();
        ps.setPopularity(0);
        if(!ps.postingsEntries.isEmpty()) {
            updatePostingsFile(ps);
        }

        // Setting the popularity of every word to 0 and updating the most popular entries
        while(iter.hasNext()) {
            ps = iter.next();
            ps.setPopularity(0);
            if(!ps.postingsEntries.isEmpty()) {
                updatePostingsFile(ps);

                if(i > word_threshold) {
                    ps.clear();
                }
            }
            ++i;
        }

        exportPopularitySet();
        exportDocumentIDs();
        exportDocumentsLength();

        popularitySet.clear();
        popularitySet.addAll(index.values());

        System.out.println("Done");
    }

    /** Remove from the popularity tree the word having the least popularity */
    private src.PostingsList getNextUnpopularPostingsList() {
        if(popularityIteratorIdx == -1) {
            popularityIterator = popularitySet.iterator();
            popularityIteratorIdx = 0;
        }

        if(popularitySet.size() <= word_threshold) {
            return null;
        }

        if(popularityIteratorIdx >= word_threshold) {
            popularityIteratorIdx = -1;
            return null;
        }

        src.PostingsList pl = popularityIterator.next();
        while(pl.postingsEntries.isEmpty()) {
            ++popularityIteratorIdx;
            pl = popularityIterator.next();
        }

        ++popularityIteratorIdx;
        return pl;
    }

    public boolean existCache() {
        return new File(CACHE_PATH + POPULARITY_FILE_NAME).exists();
    }
}
