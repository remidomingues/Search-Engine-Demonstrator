/*
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 *
 *   First version:  Johan Boye, 2010
 *   Second version: Johan Boye, 2012
 */

package src;

import java.io.Serializable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;

/**
 *   A list of postings for a given word.
 */
public class PostingsList implements Serializable, Comparable {

    /** The postings list as a linked list sorted by ascending docID */
    private LinkedList<src.PostingsEntry> list = new LinkedList<src.PostingsEntry>();

    /**  Number of postings in this list  */
    public int size() {
	   return list.size();
    }

    public boolean isEmpty() {
        return list.isEmpty();
    }

    /**  Returns the ith posting */
    public src.PostingsEntry get( int i ) {
	   return list.get( i );
    }

    public void addToken(int docID, int offset) {
        src.PostingsEntry pe = null;

        // If it is a new document (higher ID)
        if(list.isEmpty() || list.getLast().docID < docID) {
            pe = new src.PostingsEntry(docID);
            list.add(pe);

        // If it belongs to the current working document (last one inserted)
        } else if(list.getLast().docID == docID) {
            pe = list.getLast();

        // Otherwise, we must check if the document exists
        } else {
            src.PostingsEntry tmp;
            ListIterator<src.PostingsEntry> iter = list.listIterator(list.size());
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
                list.add(pe);
            }
        }

        // Offset insertion
        pe.addOffset(offset);
    }

    public ListIterator<src.PostingsEntry> listIterator() {
        return list.listIterator();
    }

    @Override
    public int compareTo(Object o) {
        if(o instanceof PostingsList) {
            return Integer.compare(size(), ((PostingsList) o).size());
        }
        return 0;
    }
}



