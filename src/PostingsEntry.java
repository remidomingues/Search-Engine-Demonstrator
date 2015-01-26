/*
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 *
 *   First version:  Johan Boye, 2010
 *   Second version: Johan Boye, 2012
 */

package src;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.TreeSet;

public class PostingsEntry implements Comparable<PostingsEntry>, Serializable {
    public int docID;
    public double score;
    /** Tokens positions sorted by ascending order */
    private LinkedList<Integer> offsets = new LinkedList<Integer>();

    public PostingsEntry(int docID) {
        this.docID = docID;
    }

    public void addOffset(int offset) {
        ++score;

        //If the current offset is higher than the last one inserted
        if(offsets.isEmpty() || offsets.getLast() < offset) {
            offsets.add(offset);

        //Otherwise, we iterate through the list
        } else {
            ListIterator<Integer> iter = offsets.listIterator();
            while(iter.hasNext()) {
                if(iter.next() > offset) {
                    iter.previous();
                    iter.add(offset);
                    return;
                }
            }
        }
    }

    public ListIterator<Integer> listIterator() {
        return offsets.listIterator();
    }

    /**
     *  PostingsEntries are compared by their score (only relevant
     *  in ranked retrieval).
     *
     *  The comparison is defined so that entries will be put in
     *  descending order.
     */
    public int compareTo( PostingsEntry other ) {
	   return Double.compare( other.score, score );
    }
}
