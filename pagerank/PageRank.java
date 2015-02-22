/*  
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 * 
 *   First version:  Johan Boye, 2012
 */

import java.util.*;
import java.io.*;

public class PageRank{
    private class RankedDoc implements Comparable {
        Integer docID;
        double rank;

        public RankedDoc(Integer docID, double rank) {
            this.docID = docID;
            this.rank = rank;
        }

        @Override
        public int compareTo(Object o) {
            return Double.compare(rank, ((RankedDoc)o).rank);
        }
    }

    /**  
     *   Maximal number of documents. We're assuming here that we
     *   don't have more docs than we can keep in main memory.
     */
    final static int MAX_NUMBER_OF_DOCS = 2000000;

    /**
     *   Mapping from document names to document numbers.
     */
    Hashtable<String,Integer> docNumber = new Hashtable<String,Integer>();

    /**
     *   Mapping from document numbers to document names
     */
    String[] docName = new String[MAX_NUMBER_OF_DOCS];

    /**  
     *   A memory-efficient representation of the transition matrix.
     *   The outlinks are represented as a Hashtable. The keys are
     *   documents ID with outlinks as values.<p>
     *
     *   The value corresponding to key i is a Hashtable whose keys are 
     *   the documents ID j that i links to.<p>
     *
     *   If there are no outlinks from i, then the value corresponding 
     *   key i is null.
     */
    Hashtable<Integer,Hashtable<Integer,Boolean>> link = new Hashtable<Integer,Hashtable<Integer,Boolean>>();

    /**
     * Stationary distribution
     */
    private RankedDoc[] pageranks;

    /**
     *   The number of outlinks from each node.
     */
    int[] out = new int[MAX_NUMBER_OF_DOCS];

    /**
     *   The number of documents with no outlinks.
     */
    int numberOfSinks = 0;

    /**
     *   The probability that the surfer will be bored, stop
     *   following links, and take a random jump somewhere.
     */
    final static double BORED = 0.15;

    /**
     *   Convergence criterion: Transition probabilities do not 
     *   change more that EPSILON from one iteration to another.
     */
    final static double EPSILON = 0.0001;

    /**
     *   Never do more than this number of iterations regardless
     *   of whether the transistion probabilities converge or not.
     */
    final static int MAX_NUMBER_OF_ITERATIONS = 1000;

    
    /* --------------------------------------------- */


    public PageRank( String filename ) {
	int noOfDocs = readDocs( filename );
	computePagerank( noOfDocs );
    }


    /* --------------------------------------------- */


    /**
     *   Reads the documents and creates the docs table. When this method 
     *   finishes executing then the @code{out} vector of outlinks is 
     *   initialised for each doc, and the @code{p} matrix is filled with
     *   zeroes (that indicate direct links) and NO_LINK (if there is no
     *   direct link. <p>
     *
     *   @return the number of documents read.
     */
    int readDocs( String filename ) {
	int fileIndex = 0;
	try {
	    System.err.print( "Reading file... " );
	    BufferedReader in = new BufferedReader( new FileReader( filename ));
	    String line;
	    while ((line = in.readLine()) != null && fileIndex<MAX_NUMBER_OF_DOCS ) {
		int index = line.indexOf( ";" );
		String title = line.substring( 0, index );
		Integer fromdoc = docNumber.get( title );
		//  Have we seen this document before?
		if ( fromdoc == null ) {	
		    // This is a previously unseen doc, so add it to the table.
		    fromdoc = fileIndex++;
		    docNumber.put( title, fromdoc );
		    docName[fromdoc] = title;
		}
		// Check all outlinks.
		StringTokenizer tok = new StringTokenizer( line.substring(index+1), "," );
		while ( tok.hasMoreTokens() && fileIndex<MAX_NUMBER_OF_DOCS ) {
		    String otherTitle = tok.nextToken();
		    Integer otherDoc = docNumber.get( otherTitle );
		    if ( otherDoc == null ) {
			// This is a previousy unseen doc, so add it to the table.
			otherDoc = fileIndex++;
			docNumber.put( otherTitle, otherDoc );
			docName[otherDoc] = otherTitle;
		    }
		    // Set the probability to 0 for now, to indicate that there is
		    // a link from fromdoc to otherDoc.
		    if ( link.get(fromdoc) == null ) {
			link.put(fromdoc, new Hashtable<Integer,Boolean>());
		    }
		    if ( link.get(fromdoc).get(otherDoc) == null ) {
			link.get(fromdoc).put( otherDoc, true );
			out[fromdoc]++;
		    }
		}
	    }
	    if ( fileIndex >= MAX_NUMBER_OF_DOCS ) {
		System.err.print( "stopped reading since documents table is full. " );
	    }
	    else {
		System.err.print( "done. " );
	    }
	    // Compute the number of sinks.
	    for ( int i=0; i<fileIndex; i++ ) {
		if ( out[i] == 0 )
		    numberOfSinks++;
	    }
	}
	catch ( FileNotFoundException e ) {
	    System.err.println( "File " + filename + " not found!" );
	}
	catch ( IOException e ) {
	    System.err.println( "Error reading file " + filename );
	}
	System.err.println( "Read " + fileIndex + " number of documents" );
	return fileIndex;
    }


    /* --------------------------------------------- */

    private boolean similar(double[] m1, double[] m2) {
        for(int i = 0; i < m1.length; ++i) {
            if(Math.abs(m1[i] - m2[i]) > EPSILON) {
                return false;
            }
        }
        return true;
    }

    private double[] power_iteration(double[] x) {
        //pno_link = (1-c)*j = (1-c)*(1/numberOfDocs)
        double pno_link = BORED / x.length;
        //if we there is no outlink from the current doc, we have 100% chance to jump
        double pno_outlink = 1. / x.length;
        double plink = 0;
        double[] result = new double[x.length];
        Hashtable<Integer, Boolean> outlinks;

        // For each row of the transition matrix
        for(int i = 0; i < x.length; ++i) {
            outlinks = link.get(i);

            // No outlink
            if (outlinks != null) {
                //c * (1 / number of outlinks) + proba no link
                plink = ((1 - BORED) / outlinks.size() + pno_link);
            }

            if(x[i] != 0) {
                // Compute the beginning of each result probability related to the same row in the transition matrix
                for (int j = 0; j < x.length; ++j) {
                    if(outlinks == null) {
                        result[j] += x[i] * pno_outlink;
                    } else if (!outlinks.containsKey(j)) {
                        result[j] += x[i] * pno_link;
                    } else {
                        result[j] += x[i] * plink;
                    }
                }
            }
        }

        return result;
    }


    /*
     *   Computes the pagerank of each document.
     */
    void computePagerank( int numberOfDocs ) {
        System.out.println("Computing pagerank...");

        // transition = c * transition + (1 - c) * J
        // Initialize x and x2
        double[] x = new double[numberOfDocs];
        double[] x2 = new double[numberOfDocs];
        x2[0] = 1;

        // Power iterations algorithm to find the stationary probability for each state
        int i = 0;
        // Until convergence or max iterations is reached
        while(i < MAX_NUMBER_OF_ITERATIONS && !similar(x, x2)) {
            x = x2;
            x2 = power_iteration(x);
            ++i;

            System.out.println("Iteration " + i);
        }

        // Initialize the pageranks data structure and sort it
        pageranks = new RankedDoc[numberOfDocs];
        for(i = 0; i < numberOfDocs; ++i) {
            pageranks[i] = new RankedDoc(i, x2[i]);
        }
        Arrays.sort(pageranks, Collections.reverseOrder());

        System.out.println("Done");
    }

    public void display(int n) {
        String template = "%d: %s %f";
        for(int i = 0; i < n && i < pageranks.length; ++i) {
            System.out.println(String.format(template, i+1, docName[pageranks[i].docID], pageranks[i].rank));
        }
    }

    /* --------------------------------------------- */


    public static void main( String[] args ) {
	if ( args.length != 1 ) {
	    System.err.println( "Please give the name of the link file" );
	}
	else {
	    PageRank pr = new PageRank( args[0] );
        pr.display(50);
	}
    }
}
