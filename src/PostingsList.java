/*
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 *
 *   First version:  Johan Boye, 2010
 *   Second version: Johan Boye, 2012
 */

package src;

import java.io.*;
import java.util.*;

/**
 *   A postingsEntries of postings for a given word.
 */
public class PostingsList implements Serializable, Comparable {

    /** The postings postingsEntries as a linked postingsEntries sorted by ascending docID */
    public LinkedList<src.PostingsEntry> postingsEntries = new LinkedList<src.PostingsEntry>();

    public String token;

    private int popularity = 0;

    public PostingsList() {
        this.token = null;
    }

    public PostingsList(String token) {
        this.token = token;
    }

    /**  Number of postings in this postingsEntries  */
    public int size() {
	   return postingsEntries.size();
    }

    public boolean isEmpty() {
        return postingsEntries.isEmpty();
    }

    public void increasePopularity() {
        ++popularity;
    }

    public void setPopularity(int popularity) {
        this.popularity = popularity;
    }

    public int getPopularity() {
        return popularity;
    }

    public void clear() {
        postingsEntries.clear();
    }

    /**  Returns the ith posting */
    public src.PostingsEntry get( int i ) {
	   return postingsEntries.get( i );
    }

    public void addToken(int docID, int offset, src.PostingsEntry fullEntry) {
        src.PostingsEntry pe = null;

        // If it is a new document (higher ID)
        if(postingsEntries.isEmpty() || postingsEntries.getLast().docID < docID) {
            if(fullEntry == null) {
                pe = new src.PostingsEntry(docID);
            } else {
                pe = fullEntry;
            }
            postingsEntries.add(pe);

        // If it belongs to the current working document (last one inserted)
        } else if(postingsEntries.getLast().docID == docID) {
            pe = postingsEntries.getLast();

        // Otherwise, we must check if the document exists
        } else {
            src.PostingsEntry tmp;
            ListIterator<src.PostingsEntry> iter = postingsEntries.listIterator();
            while(iter.hasPrevious() && pe == null) {
                tmp = iter.previous();
                if(tmp.docID == docID) {
                    // The document exists
                    pe = tmp;
                } else if(tmp.docID > docID) {
                    iter.next();
                    pe = new src.PostingsEntry(docID);
                    iter.add(pe);
                }
            }
            // The document does not exist
            if(pe == null) {
                pe = new src.PostingsEntry(docID);
                postingsEntries.add(pe);
            }
        }

        if(fullEntry == null) {
            // Offset insertion
            pe.addOffset(offset);
        }
    }

    public ListIterator<src.PostingsEntry> postingsEntriesIterator() {
        return postingsEntries.listIterator();
    }

    @Override
    public int compareTo(Object o) {
        if(o instanceof PostingsList) {
            int r = Integer.compare(getPopularity(), ((PostingsList) o).getPopularity());
            if(r == 0) {
                r = Integer.compare(postingsEntries.size(), ((PostingsList) o).postingsEntries.size());
                if(r == 0) {
                    return token.compareTo(((PostingsList) o).token);
                }
            }
            return r;
        }
        return 0;
    }


}



