
package src;

import java.util.*;

public class BigramIndex  extends src.Index {
    /** The index as a hashtable. */
    private HashMap<String, HashMap<String, src.PostingsList>> index = new HashMap<String, HashMap<String, src.PostingsList>>();
    private String previous = null;
    private int currentDocID = -1;

    private int nbigrams = 0;

    /**
     *  Inserts this token in the index, linked to the previous word (bigram)
     */
    public void insert( String token, int docID, int offset ) {

        HashMap<String, src.PostingsList> map;

        if(currentDocID != docID) {
            previous = null;
            currentDocID = docID;
        }

        if(previous == null) {
            previous = token;
            return;
        }


        map = index.get(previous);
        if(map == null) {
            map = new HashMap<String, src.PostingsList>();
            index.put(previous, map);
        }

        src.PostingsList ps = map.get(token);
        if(ps == null) {
            ps = new src.PostingsList(token);
            map.put(token, ps);
            ++nbigrams;
        }

        ps.addToken(docID, -1, null);
        previous = token;
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
    public src.PostingsList getPostings( String token1, String token2 ) {
        HashMap<String, src.PostingsList> map = index.get(token1);
        if(map != null) {
            return map.get(token2);
        }
        return null;
    }

    public src.PostingsList search( src.Query query, int queryType, int rankingType, int structureType ) {
        src.PostingsList ps = new src.PostingsList();
        LinkedList<String> tokens = query.terms;

        if(queryType ==  src.Index.RANKED_QUERY && rankingType == src.Index.TF_IDF && structureType == src.Index.BIGRAM) {
            int tokenIdx = 0;
            double tfidfScore, cos_sim;
            src.Vector queryVector = null;
            HashMap<Integer, src.Vector> docVectors = null;
            src.PostingsEntry pe;
            TreeSet<src.PostingsEntry> pagerankedDocs = null;
            src.PostingsEntry[] docArray;

            //TF-IDF QUERY
            // Query vector
            if(query.vector == null) {
                queryVector = src.Vector.ones(tokens.size()-1);
                queryVector.normalize();
            } else {
                queryVector = query.vector;
            }
            docVectors = new HashMap<Integer, src.Vector>();

            // RANKED QUERY
            // Compute the TF-IDF vectors for each document
            String previousTk = null;
            for(String token : tokens) {
                if(previousTk == null) {
                    previousTk = token;
                    continue;
                }

                src.PostingsList tokenPostings = getPostings(previousTk, token);
                if(tokenPostings != null) {
                    for (src.PostingsEntry entry : tokenPostings.postingsEntries) {
                        src.Vector v = docVectors.get(entry.docID);
                        if (v == null) {
                            v = new src.Vector(tokens.size()-1);
                            docVectors.put(entry.docID, v);
                        }

                        // Update the TF-IDF score of one term for one document
                        tfidfScore = entry.score * Math.log10(nbigrams / (double) tokenPostings.postingsEntries.size());
                        v.set(tokenIdx, tfidfScore);
                    }
                }
                ++tokenIdx;
                previousTk = token;
            }

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

                pe.score = cos_sim;
                docArray[i] = pe;
                ++i;
            }

            // Sort the results
            Arrays.sort(docArray);
            for(src.PostingsEntry tmp : docArray) {
                ps.postingsEntries.add(tmp);
            }
        }
        return ps;
    }

    public void indexingOver() {
        updateEntryScores();
        computeDocumentNorms();
    }

    public void cleanup() {}private void updateEntryScores() {
        for(HashMap<String, src.PostingsList> map : index.values()) {
            for (src.PostingsList ps : map.values()) {
                for (src.PostingsEntry pe : ps.postingsEntries) {
                    pe.score /= docLengths.get("" + pe.docID);
                }
            }
        }
    }

    private void computeDocumentNorms() {
        System.out.println("Computing document norms...");
        for(HashMap<String, src.PostingsList> map : index.values()) {
            for (src.PostingsList ps2 : map.values()) {
                for (src.PostingsEntry pe : ps2.postingsEntries) {
                    Double score = docNorm.get(pe.docID);
                    if (score == null) {
                        score = 0.0;
                    }
                    score += pe.score * Math.log10(nbigrams / (double) ps2.postingsEntries.size());
                    docNorm.put(pe.docID, score);
                }
            }
        }
        System.out.println("Done");
    }

    public src.PostingsList getPostings( String token ) { return null;}
    public void nextDoc() {}
    public boolean importIndex() {return false;}
}
