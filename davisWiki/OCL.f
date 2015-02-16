These are some scripts to make searching the open course list easy. Theyre written by Users/KenBloom Ken Bloom and theyre in the public domain.

 updatecourses 
Downloads the current copy of the course list.

{{{
#! /bin/tcsh
lynx dump dontwrappre http://registrar.ucdavis.edu/ocl/opencourses.html > opencourses.txt
}}}

 findclass 
Finds classes by course number, when the numbers are given like {{{LIN 001}}}, {{{MAT 016A}}}, or simply given the 3letter department code, it can display a whole department.

For example {{{ findclass MAT 016A }}} or {{{ findclass MAT }}} or {{{ findclass MAT 1.. }}}. (That last one finds all upper division courses in the math department.

{{{
#!/usr/bin/perl
$FILEopencourses.txt;
open(FILE);
@lines<FILE>;
close(FILE);
$findstat0;
foreach $line (@lines) {
	if ( $findstat  0 && $line ~ /^09 ^+$ARGV0/){
		$findstat1;
	}
	if ($findstat  1 && $line !~ /^ / &&  $line !~ /^09 +$ARGV0/){
		exit;
	}
	if ($findstat  1){
		print $line;
	}
}
}}}

 checkcrn 
Checks the number of spaces left in the given course sections.

For example {{{ checkcrn 89483 58372 90929 }}}

{{{
#!/usr/bin/perl
$FILEopencourses.txt;
open(FILE);
@lines<FILE>;
close(FILE);
CRN: foreach $crn (@ARGV){
	$findstat0;
	foreach $line (@lines) {
		if ( $findstat  0 && $line ~ /^\Q$crn\E/){
			$findstat1;
		}
		elsif ($findstat  1 && $line !~ /^ /){
			next CRN;
		}
		if ($findstat  1){
			print $line;
		}
	}
}
}}}
