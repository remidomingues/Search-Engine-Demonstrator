

ISUN was an oncampus server that you could wiki:WikiPedia:Secure_shell ssh into to check your UC Davis EMail mail with wiki:WikiPedia:Pine_(email_client) pine, wiki:WikiPedia:Elm_(email_client) elm, etc. isun.ucdavis.edu was retired from service in February 2009.  This was done because the powers that be decided that providing unix shell accounts to the campus community was no longer that important and not worth the time and resources to maintain, cf. UC Davis IRC Server.


At one point, one could use wiki:WikiPedia:Telnet Telnet to access isun, but this was discontinued on May 18, 2005 in the ongoing effort to make the campus network more secure. wiki:WikiPedia:List_of_email_clients Text based mail clients such as pine are much faster than geckomail, especially at times of high network traffic. But you could do a lot more than just check your email with this server.  It was a general purpose UNIX system that gives you access to many programming language compilers and interpreters such as g++, c++, perl (but not python), and several other command line utilities. Heres a modified description of ISUN from UC Davis website:

ISUN  IET Unix Systems
  Description: ISUN allows general access to Unix systems for email (Pine), WWW, Usenet news, and other Unix services. The ISUN service is a group of SUN/SPARC servers, accessed using the service name, isun.ucdavis.edu. Your alloted diskspace is limited to 80 megs.

  Department: Information & Educational Technology
  Email: ithelp@ucdavis.edu
  Location: accessed via campus computer labs and internet
  Web Site: http://it.ucdavis.edu/fsg/gcr_ca.html
  Restricted Access? No
  UCD LoginID Accepted? Yes
  Old Style Easy Access Account Accepted? Yes
  UCD Kerberos Password Required? No

If you came to Davis after a given date (July 10, 2000), an ISUN account was not automatically set up for you.  You can set up an account, using your current UCD kerberos username/login at the  https://computingaccounts.ucdavis.edu/cgibin/services/index.cgi computing accounts website.  Best of all, its Getting the most out of your student fees free if youre a student, faculty or staff member.

The disk quota was roughly 100MB (as of 11/26/05).

 Using isun 
Beginning May 18, 2005, as part of an ongoing effort to maintain a secure campus computing environment, you were no longer be able to access the ISUN servers using the telnet or FTP protocols. You could still use ssh and scp, respectively. For ssh, on a Mac or linux, open up a Terminal prompt and type:

ssh isun.ucdavis.edu l username or ssh username@isun.ucdavis.edu

when it prompts you for a password, type your kerberos password at the prompt.

If you are on Windows, download an ssh client such as http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html Putty. Its very user friendly.

You can see some stats on the servers login numbers http://ism.ucdavis.edu/stats/logingraph/cumulative/cumu.html here


 isun Tips 
 Proxy Service 
On the Shields Library website, there are hundreds of databases available to University students for research, containing the full text of millions of articles. Unfortunately, many of these can only be accessed from campus computers. You can use ssh to create a proxy server to run your web connections through the isun computers (or any SSH server, such as the Electrical and Computer Engineering ECE or CSIF machines) so that it looks like youre connecting to these databases from on campus.

To do this, (in Linux or on the Macintosh) run the command {{{ssh D 7700 isun.ucdavis.edu}}}. This creates a proxy server on localhost:7700, and you can configure your web browser to use localhost:7700 as a SOCKS 5 proxy server (directions vary by browser) and all of your web connections will be tunnelled through campus. This can be done on Windows with the http://www.cygwin.com Cygwin port of SSH, available as part of the Cygwin package or separately from http://sshwindows.sourceforge.net.

Bear in mind that the version of SSH that came with older versions of Mac OS X only supported SOCKS 4, while Safari only supported SOCKS 5. This problem has been fixed at least since Tiger (10.4).

When you disconnect from isun.ucdavis.edu, be sure to set your web browsers configuration back to what it was, otherwise you wont be able to connect to any websites.
 Textbased Browsing 
You can also use isun to browse websites using the textbased browser wiki:WikiPedia:Lynx_(web_browser) Lynx. This comes in handy when your ISPs webservice craps out, but other services (such as SSH) are still running. For general use, its all text interface is ideal for simple web browsing, especially on services such as http://www.imdb.com imdb, where superfluous pictures and ads slow down browing on pictorial browsers. For modem users, lynx is a necessity. Note that the daviswiki is lynx compatible, both in terms of browsing and editing.
 IRC 
You can also use your shell account to connect to the Davis Wiki IRC DavisWiki IRC channel.  To do so, follow these instructions: At the command prompt, simply type {{{irc yournick irc.freenode.net}}}, followed by enter/return.  After youre connected, type {{{/join #daviswiki}}}. (Note that you should replace yournick above with a nickname that you chose for yourself.) wiki:WikiPedia:Internet_Relay_Chat IRC is a technology that has been around far, far longer than wiki.  It allows you to chat in real time with people from around the world (or just in Davis) in a group or individual format.

The IRC program installed on isun is quite old ({{{ircII version 2.9_roof (19960721)}}}) and still defaults to {{{irc.ucdavis.edu}}}, even if you specify a server. To solve this problem, run irc, then type: {{{/SERVER DELETE irc.ucdavis.edu}}}, followed by {{{/SAVE ALL}}}, and confirm that you would like to save the new configuration. (thanks to Users/DavidReid dreid)

 MySpace 

The files that can be uploaded and accessed using the MySpace feature of MyUCDavis (click on My Tools in the toolbar, and then on MySpace) are accessible on isun, under {{{/afs/home.ucdavis.edu/home/}}}. This is useful when MyUCDavis is down or malfunctioning. Within the {{{home/}}} folder, there are ~925 directories with names like {{{a0}}}, {{{a1}}}, etc. Within these directories lie the user folders. To figure out which folder your user folder is in, type {{{pwd}}} when you first log into isun. For example, when Users/ArlenAbraham I log into isun and type {{{pwd}}} it returns {{{/home/an/arlen}}}, I can then get to my myspace folder at {{{/afs/home.ucdavis.edu/home/an/arlen}}}. Windows users who are not comfortable with using the Unix command line, might like http://winscp.net/eng/index.php WinSCP or http://filezilla.sourceforge.net Filezilla(recently ported to linux too), these are graphical tools for mass file moving.

 The end? 

IET claims it will shut down the service on February 27, 2009.  That sucks.
     Its the end of an era. . .


20090324 12:17:03 nbsp Does anyone know where the isun name came from?  Is it an acronym?  Was it originally a Sun system? Users/IDoNotExist

20090324 12:50:49 nbsp The name came from the 4 letter role identifier (aka permit) used to provision accounts in the Mothra account management system. The systems had been Suns since at least 1992, (there were also two DEC Ultrix systems at the time,) but at the time we implemented isun there were only Suns. The I prefix was used for a few different permits, I think it referred to the permit as being an IT service as opposed to some other departmental permit. Users/ChrisLambertus

20090324 12:54:44 nbsp Were there any other machines with similarly derived names? Users/IDoNotExist

20090324 13:42:54 nbsp I dont believe any other systems used the permit name as the hostname. isun was actually a roundrobin DNS record during my tenure, which pointed to an evershifting array of Sun hardware and hostnames. Im sure someone with the interest could add the list here for posterity, but itd have to be someone with more free time than I. :)
 Users/ChrisLambertus
 At the time of the systems retirement in early 2009, the hostnames were veni, vidi, and vici. These hostnames date to at least 2005 and possibly before. wl.
 Theres also logan, sandman, and runner, but those might have been mailservers rather than hostnames. CraigBrozinsky
  I know that the student mail servers from 2005 until the Gmail switchover were named after colors... I just remember the ones I was on... purple and salmon. wl

20090521 17:34:18 nbsp It is extremely sad they shut this down. I am a new student Fall 09 and I was really looking forward to a UC Davis shell. Maybe we can start a petition to get this back up and running.  Users/cwverdun
