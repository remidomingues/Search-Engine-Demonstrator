This script will only work when Computer Science Instructional Facility CSIFs http://wwwcsif.cs.ucdavis.edu/load.html load average webpage is working (it goes down more often than Id like).

{{{#!/bin/bash

CONNECTHOST$(curl s http://wwwcsif.cs.ucdavis.edu/load.html | egrep ssh | head n 1 | /usr/bin/sed E e s/<\/?TD>//g e s/<A.:\/\/// e s/>.>//g)

ssh username@$CONNECTHOST

exit 0}}}

Replace username with your CSIF username, of course. Add an X or Y to the SSH line, as appropriate, if you wish to do X11 tunneling.
