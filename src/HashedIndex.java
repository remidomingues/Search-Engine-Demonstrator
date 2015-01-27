/*
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 *
 *   First version:  Johan Boye, 2010
 *   Second version: Johan Boye, 2012
 *   Additions: Hedvig Kjellström, 2012-14
 */


package src;

import java.util.*;


/**
 *   Implements an inverted index as a Hashtable from words to PostingsLists.
 */
public class HashedIndex implements src.Index {

    /** The index as a hashtable. */
    private HashMap<String, src.PostingsList> index = new HashMap<String, src.PostingsList>();

    /**
     *  Inserts this token in the index.
     */
    public void insert( String token, int docID, int offset ) {
        src.PostingsList ps = index.get(token);
        if(ps == null) {
            ps = new src.PostingsList();
            index.put(token, ps);
        }
        ps.addToken(docID, offset);
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
        int maxDocID, nlists = 0, tmp;

        // Postings retrieval
        for(String t : tokens) {
            src.PostingsList postings = getPostings(t);
            if(postings == null) {
                return null;
            }
            docsIterators.add(postings.listIterator());
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
                    result.addToken(maxDocID, -1);
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
                    // If the document contains at least one sentence (//TODO ASSIGNMENT 2 => RANKING)
                    if(!positions.isEmpty())
                        // It is a result
                        result.addToken(maxDocID, -1);
                }
            } else {
                // For every other list
                for(ListIterator<src.PostingsEntry> iter : docsIterators) {
                    if(iter.previous().docID != maxDocID) {
                        iter.next();
                        // We iterate until we reach a docID higher or equal, or the end of the list
                        while(iter.hasNext() && iter.next().docID < maxDocID);
                        iter.previous();
                    }
                }
            }
        }
    }

    /**
     *  Searches the index for postings matching the query.
     */
    public src.PostingsList search( src.Query query, int queryType, int rankingType, int structureType ) {
        if(query.size() == 1) {
            return getPostings(query.terms.get(0));
        }
        if(query.size() > 1) {
            if(queryType == src.Index.INTERSECTION_QUERY || queryType == src.Index.PHRASE_QUERY) {
                return getIntersectionPostings(query.terms, queryType);
            }
        }

        return null;
    }


    /**
     *  No need for cleanup in a HashedIndex.
     */
    public void cleanup() {
    }
}
