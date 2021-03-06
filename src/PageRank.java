/*  
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 * 
 *   First version:  Johan Boye, 2012
 */

package src;

import java.util.*;
import java.io.*;

public class PageRank implements Serializable {
    private enum PageRankMethod {
        POWER_ITERATION,
        MONTE_CARLO_1,
        MONTE_CARLO_2,
        MONTE_CARLO_3,
        MONTE_CARLO_4,
        MONTE_CARLO_5,
    }

    private class RankedDoc implements Comparable {
        Integer docID;
        double score;

        public RankedDoc(Integer docID, double score) {
            this.docID = docID;
            this.score = score;
        }

        @Override
        public int compareTo(Object o) {
            return Double.compare(score, ((RankedDoc)o).score);
        }
    }

    private static Random rand = new Random(System.currentTimeMillis());

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
    transient String[] docName = new String[MAX_NUMBER_OF_DOCS];

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
    transient Hashtable<Integer,Hashtable<Integer,Boolean>> link = new Hashtable<Integer,Hashtable<Integer,Boolean>>();

    /**
     * Stationary distribution
     */
    double[] pageranks;

    /**
     * Stationary distribution sorted in descending order
     */
    transient RankedDoc[] sorted_pageranks;

    /**
     *   The number of outlinks from each node.
     */
    transient int[] out = new int[MAX_NUMBER_OF_DOCS];

    /**
     *   The number of documents with no outlinks.
     */
    transient int numberOfSinks = 0;

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

    final static String LINKS_FILE = "./resources/linksDavis.txt";

    
    /* --------------------------------------------- */

    public PageRank() {
        int noOfDocs = readDocs( LINKS_FILE );
        computePagerank( noOfDocs, PageRankMethod.POWER_ITERATION, MAX_NUMBER_OF_ITERATIONS, null, null );
    }

    public PageRank( String filename, PageRankMethod method, int max_iter ) {
    	int noOfDocs = readDocs( filename );
	    computePagerank( noOfDocs, method, max_iter, null, null );
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
		System.err.print( "stopped reading since documents table is full." );
	    }
	    else {
		System.err.print( "done." );
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

    private double[] power_iterations(int numberOfDocs, int max_iter) {
        // transition = c * transition + (1 - c) * J
        // Initialize x and x2
        double[] x = new double[numberOfDocs];
        double[] x2 = new double[numberOfDocs];
        x2[0] = 1;

        // Power iterations algorithm to find the stationary probability for each state
        int i = 0;
        // Until convergence or max iterations is reached
        while(i < max_iter && !similar(x, x2)) {
            x = x2;
            x2 = power_iteration(x);
            ++i;

            System.out.println("Iteration " + i);
        }

        return x2;
    }

    private double[] monte_carlo(int numberOfDocs, int iterations, PageRankMethod method, int[] bench_steps, double[][] benchmarks, RankedDoc[] ranking_ref) {
        int step, page, next_idx, i, sum_steps = 0, bench_step = -1, bench_idx = 0;
        Hashtable<Integer, Boolean> outlinks;
        double[] pageranks = new double[numberOfDocs];
        double[] bench_pageranks = pageranks;
        RankedDoc[] tmp_sorted_pageranks;

        if(bench_steps != null) {
            bench_step = bench_steps[bench_idx];
        }

        // N runs
        for(int k = 0; k < iterations; ++k) {
            if(method != PageRankMethod.MONTE_CARLO_1 && method != PageRankMethod.MONTE_CARLO_5) {
                page = k % numberOfDocs;
            } else {
                page = rand.nextInt(numberOfDocs);
            }

            // One run
            while(true) {
                if(method != PageRankMethod.MONTE_CARLO_1 && method != PageRankMethod.MONTE_CARLO_2) {
                    pageranks[page] += 1;
                    ++sum_steps;
                }

                outlinks = link.get(page);

                if(Math.random() < BORED) {
                    break;
                }

                // Random jump
                if(outlinks == null) {
                    // Run ends when a dangling node is reached
                    if(method == PageRankMethod.MONTE_CARLO_4 || method == PageRankMethod.MONTE_CARLO_5) {
                        break;
                    }

                    page = rand.nextInt(numberOfDocs);

                // Move randomly to the next page
                } else {
                    next_idx = rand.nextInt(outlinks.size());
                    i = 0;
                    // Fastest random access in a set (O(outlinks/2))
                    for(Integer tmp_page : outlinks.keySet()) {
                        if(i == next_idx) {
                            page = tmp_page;
                            break;
                        }
                        ++i;
                    }
                }
            }

            // Update the score of the end node for MC1 and MC2
            if(method == PageRankMethod.MONTE_CARLO_1 || method == PageRankMethod.MONTE_CARLO_2) {
                pageranks[page] += 1;
            }

            // Benchmarking
            if(bench_step == k) {
                if(method != PageRankMethod.MONTE_CARLO_1 && method != PageRankMethod.MONTE_CARLO_2) {
                    bench_pageranks = new double[pageranks.length];
                    for(int s = 0; s < pageranks.length; ++s) {
                        bench_pageranks[s] = pageranks[s] / sum_steps;
                    }
                } else {
                    bench_pageranks = new double[pageranks.length];
                    for(int s = 0; s < pageranks.length; ++s) {
                        bench_pageranks[s] = pageranks[s] / (k+1);
                    }
                }

                tmp_sorted_pageranks = new RankedDoc[numberOfDocs];
                for(int s = 0; s < numberOfDocs; ++s) {
                    tmp_sorted_pageranks[s] = new RankedDoc(s, bench_pageranks[s]);
                }
                Arrays.sort(tmp_sorted_pageranks, Collections.reverseOrder());

                benchmarks[0][bench_idx] = sum_squared_error(ranking_ref, tmp_sorted_pageranks, 50, true);
                benchmarks[1][bench_idx] = sum_squared_error(ranking_ref, tmp_sorted_pageranks, 50, false);
                benchmarks[2][bench_idx] = sum_indexing_error(ranking_ref, tmp_sorted_pageranks, 50, true) / 50.0;

                ++bench_idx;
                if(bench_idx < bench_steps.length) {
                    bench_step = bench_steps[bench_idx];
                }
            }
        }

        // Divide the number of visits per node by the total number of visits for MC3, MC4 and MC5
        if(method != PageRankMethod.MONTE_CARLO_1 && method != PageRankMethod.MONTE_CARLO_2) {
            for(int s = 0; s < pageranks.length; ++s) {
                pageranks[s] /= sum_steps;
            }
        } else {
            for(int s = 0; s < pageranks.length; ++s) {
                pageranks[s] /= iterations;
            }
        }

        return pageranks;
    }


    /*
     *   Computes the pagerank of each document.
     */
    private double[][] computePagerank(int numberOfDocs, PageRankMethod method, int max_iter, int[] steps, RankedDoc[] ranking_ref) {
        double[][] benchmarks = null;
        System.out.println("Computing pagerank...");

        if(method == PageRankMethod.POWER_ITERATION) {
            pageranks = power_iterations(numberOfDocs, max_iter);
        } else {
            if(steps != null) {
                benchmarks = new double[3][];
                // Error for the 50 highest scores
                benchmarks[0] = new double[steps.length];
                // Error for the 50 lowest scores
                benchmarks[1] = new double[steps.length];
                // Average indexing error for the 50 highest scores
                benchmarks[2] = new double[steps.length];
            }
            pageranks = monte_carlo(numberOfDocs, max_iter, method, steps, benchmarks, ranking_ref);
        }

        // Initialize the pageranks data structure and sort it
        sorted_pageranks = new RankedDoc[numberOfDocs];
        for(int i = 0; i < numberOfDocs; ++i) {
            sorted_pageranks[i] = new RankedDoc(i, pageranks[i]);
        }
        Arrays.sort(sorted_pageranks, Collections.reverseOrder());

        return benchmarks;
    }

    public double get(String docName) {
        return pageranks[docNumber.get(docName)];
    }

    public void display(int n) {
        String template = "%d: %s %f";
        for(int i = 0; i < n && i < pageranks.length; ++i) {
            System.out.println(String.format(template, i+1, docName[sorted_pageranks[i].docID], sorted_pageranks[i].score));
        }
    }

    private static int sum_indexing_error(RankedDoc[] ranking1, RankedDoc[] ranking2, int n, boolean descending) {
        int error = 0;
        int start, end, step;

        if(descending) {
            start = 0;
            end = n;
            step = 1;
        } else {
            start = ranking1.length - 1;
            end = ranking1.length - n - 1;
            step = -1;
        }

        for(int i = start; i != end; i += step) {
            for(int j = 0; j < ranking2.length; ++j) {
                if(ranking2[j].docID.equals(ranking1[i].docID)) {
                    error += Math.abs(i - j);
                    break;
                }
            }
        }

        return error;
    }

    private static double sum_squared_error(RankedDoc[] ranking1, RankedDoc[] ranking2, int n, boolean descending) {
        double error = 0, tmp;
        int start, end, step;

        if(descending) {
            start = 0;
            end = n;
            step = 1;
        } else {
            start = ranking1.length - 1;
            end = ranking1.length - n - 1;
            step = -1;
        }

        for(int i = start; i != end; i += step) {
            for(int j = 0; j < ranking2.length; ++j) {
                if(ranking2[j].docID.equals(ranking1[i].docID)) {
                    tmp = ranking1[i].score - ranking2[j].score;
                    error += tmp * tmp;
                    break;
                }
            }
        }

        return error;
    }

    public static double[][][] benchmark(PageRank pr, int[] steps) {
        double[][][] ssd = new double[PageRankMethod.values().length-1][][];
        //double[][][] ssd = new double[1][][];
        RankedDoc[] ranking_ref = pr.sorted_pageranks.clone();
        int ndocs = ranking_ref.length;

        for(int i = 0; i < ssd.length; ++i) {
            ssd[i] = pr.computePagerank(ndocs, PageRankMethod.values()[i + 1], steps[steps.length - 1] + 1, steps, ranking_ref);
            //ssd[i] = pr.computePagerank(ndocs, PageRankMethod.MONTE_CARLO_3, steps[steps.length-1]+1, steps, ranking_ref);
            System.out.println("Indexing error for " + PageRankMethod.values()[i + 1] + ": " + sum_indexing_error(ranking_ref, pr.sorted_pageranks, 50, true));
        }

        return ssd;
    }

    public static void display_benchmark(String link_file, int iterations, int nsteps) {
        PageRank pr = new PageRank(link_file, PageRankMethod.POWER_ITERATION, MAX_NUMBER_OF_ITERATIONS);
        int[] steps = new int[nsteps+1];

        steps[0] = 1;
        for(int i = 1; i < nsteps+1; ++i) {
            steps[i] = (int) (iterations / (double) nsteps * i);
        }

        double[][][] ssd = benchmark(pr, steps);

        StringBuilder s = new StringBuilder("steps = [");
        for(int i = 0; i < steps.length; ++i) {
            s.append("" + steps[i]);
            if(i != steps.length - 1) {
                s.append(", ");
            }
        }
        s.append("];\n");

        for(int i = 0; i < ssd.length; ++i) {
            s.append("method_" + PageRankMethod.values()[i+1] + "_high = [");
            for(int j = 0; j < steps.length; ++j) {
                s.append("" + ssd[i][0][j]);
                if(j != steps.length - 1) {
                    s.append(", ");
                }
            }
            s.append("];\n");

            s.append("method_" + PageRankMethod.values()[i+1] + "_low = [");
            for(int j = 0; j < steps.length; ++j) {
                s.append("" + ssd[i][1][j]);
                if(j != steps.length - 1) {
                    s.append(", ");
                }
            }
            s.append("];\n");

            s.append("method_" + PageRankMethod.values()[i+1] + "_high_idx = [");
            for(int j = 0; j < steps.length; ++j) {
                s.append("" + ssd[i][2][j]);
                if(j != steps.length - 1) {
                    s.append(", ");
                }
            }
            s.append("];\n");
        }

        System.out.println(s.toString());
    }

    public static void export(PageRank pr, String filepath) {
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(new FileOutputStream(filepath));
            oos.writeObject(pr);
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("Pageranks exported");
    }

    public static PageRank import_(String filepath) {
        PageRank pr = null;
        try {
            ObjectInputStream input = new ObjectInputStream(
                    new FileInputStream(new File(filepath)));
            pr = (PageRank) input.readObject();
            input.close();
        } catch (Exception e) {
        }
        System.out.println("Pageranks imported");
        return pr;
    }

    /* --------------------------------------------- */


    public static void main( String[] args ) {
        if ( args.length != 1 ) {
            System.err.println( "Please give the name of the link file" );
        }
        else {
            //PageRank pr = new PageRank(args[0], PageRankMethod.POWER_ITERATION, 1000);
            //pr.display(50);
            //System.out.println(sum_squared_error(pr.sorted_pageranks, new PageRank(args[0], PageRankMethod.MONTE_CARLO_1, 2000).pageranks, 50, true));
            display_benchmark(args[0], 48221, 100);
        }
    }
}
