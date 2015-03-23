/*
 *   This file is part of the computer assignment for the
 *   Information Retrieval course at KTH.
 *
 *   First version:  Johan Boye, 2010
 *   Second version: Johan Boye, 2012
 */


package src;

import org.apache.pdfbox.cos.COSDocument;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;

import java.io.*;


/**
 *   Processes a directory structure and indexes all PDF and text files.
 */
public class Indexer {

    /** The index to be built up by this indexer. */
    public src.Index index;

    /** The next docID to be generated. */
    private int lastDocID = 0;


    /* ----------------------------------------------- */


    /** Generates a new document identifier as an integer. */
    private int generateDocID() {
	   return lastDocID++;
    }

    /** Generates a new document identifier based on the file name. */
    private int generateDocID( String s ) {
	   return s.hashCode();
    }


    /* ----------------------------------------------- */


    /**
     *  Initializes the index as a HashedIndex.
     */
    public Indexer() {
        index = src.Index.getIndex();
    }


    /* ----------------------------------------------- */


    /**
     *  Tokenizes and indexes the file @code{f}. If @code{f} is a directory,
     *  all its files and subdirectories are recursively processed.
     */
    public void processFiles( File f ) {
    	// do not try to index fs that cannot be read
    	if ( f.canRead() ) {
    	    if ( f.isDirectory() ) {
    		String[] fs = f.list();
    		// an IO error could occur
    		if ( fs != null ) {
    		    for ( int i=0; i<fs.length; i++ ) {
    			processFiles( new File( f, fs[i] ));
    		    }
    		}
    	    } else {
    		//System.err.println( "Indexing " + f.getPath() );
    		// First register the document and get a docID
    		int docID = generateDocID();
    		index.docIDs.put( "" + docID, f.getPath() );
    		try {
    		    //  Read the first few bytes of the file to see if it is
    		    // likely to be a PDF
    		    Reader reader = new FileReader( f );
    		    char[] buf = new char[4];
    		    reader.read( buf, 0, 4 );
    		    if ( buf[0] == '%' && buf[1]=='P' && buf[2]=='D' && buf[3]=='F' ) {
    			// We assume this is a PDF file
    			try {
    			    String contents = extractPDFContents( f );
    			    reader = new StringReader( contents );
    			}
    			catch ( IOException e ) {
    			    // Perhaps it wasn't a PDF file after all
    			    reader = new FileReader( f );
    			}
    		    }
    		    else {
    			// We hope this is ordinary text
    			reader = new FileReader( f );
    		    }
    		    src.SimpleTokenizer tok = new src.SimpleTokenizer( reader );
    		    int offset = 0;
    		    while ( tok.hasMoreTokens() ) {
    			String token = tok.nextToken();
    			insertIntoIndex( docID, token, offset++ );
    		    }
    		    index.docLengths.put( "" + docID, offset );
                index.nextDoc();
    		    reader.close();
    		}
    		catch ( IOException e ) {
    		    e.printStackTrace();
    		}
    	    }
    	}
    }


    /* ----------------------------------------------- */
    /**
     *  Extracts the textual contents from a PDF file as one long string.
     */
    public String extractPDFContents( File f ) throws IOException {
    	FileInputStream fi = new FileInputStream( f );
    	PDFParser parser = new PDFParser( fi );
    	parser.parse();
    	fi.close();
    	COSDocument cd = parser.getDocument();
    	PDFTextStripper stripper = new PDFTextStripper();
    	String result = stripper.getText( new PDDocument( cd ));
    	cd.close();
    	return result;
    }

    /**
     *  Indexes one token.
     */
    public void insertIntoIndex( int docID, String token, int offset ) {
        index.insert( token, docID, offset );
    }
}

