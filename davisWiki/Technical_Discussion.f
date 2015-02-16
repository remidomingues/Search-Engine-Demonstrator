This page is a part of the Wiki Community set of pages.

Add new technical proposals and suggestions for the Davis Wiki here. If youre proposing something having to do with content or community, try the Wiki Community/Proposals entry.  Send bug reports to Bug reports and wiki:wikispot:Feature Requests to the wiki:wikispot pages.

To get involved, visit the wiki:sycamore Project Sycamore wiki, and sign up for the https://tools.cernio.com/mailman/listinfo/sycamoredev sycamoredev mailing list. Many of the wiki developers are listed on the Davis Wiki.


Older Comments can be found by going through the revision history in the Info tab. Comments are deleted only in entries marked CLEANUP 


20050329 11:54:05 nbsp links inside footnotes dont work. whine also, the footnote macro uses camel casing, but footnote is actually one word, so theres no need for this sillyness. Users/ArlenAbraham
   Hint, any macro cannot be used inside any other, which is unecisarily limiting.  Also given the complete and total inconsistancy of the markup (Image()  anyone) its incredibly difficult to parse without reimplementing moin moin.  Unfortuantly this is the system the providers have choosen for us to use, and use it we must.
     Theres no reason we cant have all markup, macros included, work from within macros.  Its just not the behavior of the current macros (this will change).  The reason why moin didnt do this is because its Parser object is too large and includes undesirable markup (such as horizontal rules, images, etc).  Weve already got a lightweight parser for use with things like Events Board, but once I integrate it with the normal parser object regular macro integration will get much easier. Speaking of {{{attachment:}}}, would you be in favor of an allinone {{{Image(name.jpg, caption, thumb, alignment)}}}style system? Users/PhilipNeustrom
     How come regular links but not interwiki links work inside macros like thumbnail? Users/NickSchmalenberger

In response to the above.  Ive been thinking a lot about this and for wiki markup there is a delicate balance between human readable and ease of parsing.  The claim for XHTML was that the reduction of human editability was not a big deal because people didnt write their HTML directly, which is patently false, and as such XHTML is more annoying than HTML (although almost no one used the auto closing rules for HTML because they where difficult to remember).  My big issues with this wikis markup has to be that the macros are not whitespace invariant, mainly the header macros and the old style attachment macro.  Most of the rest of my concerns are syntactic quibbles many of which are the result of feature creep.  {{{atachment:}}} is deprecated by the new thumbnial macros, and I dont see any reasonable reason to disallow inlined headers.  Ideally the syntax could be wrapped up in a few lines of {{{lex(1)}}} and {{{yacc(1)}}} but I think its currently too stateful.

If you where going to rebuild the system; I think typeface macros should be allowed anywhere, and that the syntax of the presentation macros should probably change so that theyre all the same style syntactically.  Also Id eliminate the table macro, replacing it with, so called, semantic markup where appropriate.  Id keep the list as is, even though it may not be consistant.  The {{{foo(bar,baz,...)}}} syntax is pretty ugly in my opinion but workable.  As for the typeface macros, Im not the biggest fan of pairing but it does mostly work, Id consider going stateful ala TeX, but most users prefer pairing I believe

The major changes would then become:
   change from {{{Foo Bar}}} headers to something akin to {{{Header(2,Foo Bar)}}} which is ugly but at least consistant.
   change from {{{}}} to {{{hr(size)}}}
   change from {{{nbsp}}} to maybe {{{____}}} ( I dont know for certain ).
   chnage from tripple curly brace (which cannot be represented?) to {{{Verbatim(text)}}}.
   possible removal of {{{heart}}} or a seperate syntax for special characters  this would also effect/clean up nobreak space.
   change from {{{ >foo bar< }}} to {{{Center(foo bar)}}}

These have some uglyness and short commings due to the given macro syntax but at least its mostly consistant.  Hmm I totally lost my point here, I guess the point is: whitespace dependents, eww; inconsistant syntax without clear breakup of layout and text, eww. Users/KennethWaters

Reverts should note themselves with Revert to n versions ago or Revert to version n.  Either would be better than the current nonsense with the timestamp.  (Although, if the latter, recent changes should probably also reflect the version number.)

20050402 19:34:57 nbsp Is DavisWiki part of the interwiki map used for interwiki links?  Because of all the recent Users/ArlenAbraham furvor about interwiki linking, I checked us out on wiki:WikiPedia:Davis,_California wikipedia and noticed that they dont interlink back to us (just a normal link).  But then I also noticed that they had an wiki:WikiPedia:Interwiki_map interwiki map that didnt contain a ref to us.  Getting, finally, to my question: is there a wiki way to interwiki back to our wiki from other wikis? Users/CarlMcCabe

   i think you can just edit the page and add davis wiki to the list. im not sure what it would take for people to start using the interwiki links.  Users/ArlenAbraham

20050403 14:03:27 nbsp davis map GIS data has a ton of stuff. what would it take to integrate GIS data into the wiki map? Users/ArlenAbraham
  20050403 16:48:41 nbsp I will be converting the map to use a vector format, so Ill take a look at that then.  What data specifically are you interested in? Users/MikeIvanov
  20051202 nbsp It would be quite simple to use UMN Mapserver to recreate the wiki map with outside sources of geographic data.

20050403 17:58:17 nbsp {{{HR}}} does not clear both  it should Users/KennethWaters
   I disagree... a long thin image right or left justified should have text flowing to the other side that can have interspersed horizontal lines.  A {{{BR(clear)}}} or something like it would make more sense.  Users/JabberWokky who dislikes comment boxes.  :)
     Structure, not presentation.  I think hr s should be put in implicitly by the header tags, rather than having an explicit mechanism. ct

20050409 14:12:34 nbsp Two pages needed to be combined, and the only way to move the pictures was to download them from one page, and upload them to another. Was there an easier way to do that? Users/CraigBrozinsky
   I fixed the rename functionality to support this properly.  So now just delete the page with the right name and rename the other to that name and youre set.  The images will be merged. Users/PhilipNeustrom

20050411 14:28:23 nbsp http://www.daviswiki.org/Haring_2205?actiondiff&date20&date11106029795  Im back on my clear rampage, and have noted that people have started doing things like this, which are patently incorrect and cause the page to look bad at ecseptionally narrow or wide widths. Im not sure how to fix it perhaps a {{{clear}}} tag that causes the next block level html element (such as a {{{<p>}}}) to be blessed with clear:both.  I dont personally like this solution but it is a decent compromise, provided people are going to care how pages look and continue padding things out manually.  Users/KennethWaters
   I agree.  Any other thoughts?  I wish that sections (using {{{headings}}}) would work in all situations, but in many cases the page has little content aside from a number of pictures (and we shouldnt penalize this).. The thumbnails work best when theres a lot of text/sections, obviously, but we should have a {{{clear}}} functionality perhaps. Users/PhilipNeustrom

20050411 21:14:27 nbsp Why not just make the Thumbnail macro inline instead of floating. Then we can move these things around with tables, the same way as we had to do before we had thumbnails. (Of course, this will break even more stuff than the Senate change) Users/KenBloom
   This is impossible with HTML/CSS.  You cant inline a div and have it maintain its width (similarly with tables  and theres the problem with tables that you cant have tables next to each other).  Also, http://www.hotdesign.com/seybold/ using tables for layout is bad^TM^.  What wed hoped for is making the thumbnails defaultly inline and optionally float left or right, but as I said, it doesnt seem possible. Users/PhilipNeustrom

  Note Bakers Square.  The icons look nice, but should be {{{Visa}}} and {{{MasterCard}}} tags rather than images uploaded to each page.  Users/JabberWokky
   theyre a bit large, maybe use smaller icons if youre going to make a macro.  Users/ArlenAbraham
    I dont like those specific icons, just the concept.  I also have a doubt as to the rights to use them (the icons from merchant services are copyrighted, dont use them elsewhere, etc, etc).  I think I know a source for some Freeasinspeech ones.  BTW, for the record, I didnt upload those.  Im just promoting the idea because I like it.  Users/JabberWokky
    I have to say that I dont like the icons at all. While its useful information it seems like commercialization to me. As the only graphic on the page it draws your eye right to the corporate logos. Id rather see the information stay in text form.  Users/jackhaskel
   I hadnt thought of the copyright infringment aspect of uploading those icons to the Bakers Square page.  I did, however, download those icons from each of the respective credit card companies web sites; they make them available as part of a press kit.  The royaltyfree action would be a very smart thing to do, though. Users/JeffLeCates

20050418 10:21:19 nbsp Given the prominence of breaking news on the front page, would it make sense for that link to disappear if no one has edited it after some period of time (3 days maybe)?  Users/CraigBrozinsky
  That is probably a good idea, I would say 5 days though.  If it is more than 5 days old it is definitely not breaking.` Users/GeorgeLewis

  I agree.  In the past we had edited the Featured Page to note a Tragic Events shooting on campus, so I think making it appear when theres something of note is a good idea.

  My vote is for three days. Its not breaking after more than that IMO. Users/JackHaskel

20050420 17:39:26 nbsp What exactly happens when someone clicks the Updated button on the Recent Changes page? I couldnt find any documentation stating how many edits it covers, how much time it covers, etc. I ask because I frequently find myself clicking on a page, then going to Info>diff to see how its changed in the past 10 minutes. Didnt it work on this latter strategy up to a couple of days ago? Why the change? Users/CraigBrozinsky
   Updated:  marks pages edited since you last pressed clear observed changes (click to see differences since you cleared).  So that means youll see all and only differences since you last pressed that Clear observed changes link at the top of the page.  If this makes sense you might want to integrate it into some sort of help page?  Can you think of a better/more intuitive interface?
   ohhhh. heh. Thats an awesome implementation, Philip I just need to start using bookmarks more regularly :)  I think the problem is I didnt read the definitions of the icons at the bottom of the page, and searching for the word Updated didnt turn anything up b/c its an icon. All is fine now Ive paraphrased what you said and added it to WikiTips. Users/CraigBrozinsky
    Bookmarks are different, though!  But Ill remove the reference to bookmark on the recent changes page to avoid the confusion.
     Gotcha clarification complete. now that i understand them, bookmarks are a neat idea. finally i can get some work done without obsessing over recent changes every 26.3 seconds!


Does anyone who run windows know why so many images are uploaded with names like {{{C__Documents%20and%20Settings_Leviathan_My%20Documents_My%20Pictures_pse.jpg}}}?  On my mac it grabs just the pse.jpg part for the name.
 20050420 23:05:46 nbsp Looks like IE screws up the upload file name. Users/AndrewChen
    Just checked in IE, this seems to be the case  Users/ArlenAbraham
       This should be fixed now.  It should be confirmed by somebody with windows IE, though.

20050422 12:36:33 nbsp Is there a way to find out what pages link to a certain page? Users/GonzaloEyzaguirre
   If you just click on the page title itll do a search for the page title.  Doing said search will turn up all links to the page in question (but will also contain other pages that might not have the exact phrase but are related).
     You can now go to Info > Links or click on the page title.

20050518 22:52:40 nbsp It would be neat if there were a script that would automatically search the contents of pages currently in the editing process for words that can be linked to other wiki pages and provide a checkbox if you would like to add the link it suggests. Is this possible/desireable?Users/MichaelGiardina
  But links arent easy to add in this way because the links on a page are usually embedded in narrative or descriptive text, which would require more editing on a users part.  An alternative, however, would be a script that produces suggestion blurb at the top that says, Hey perhaps considering making this page link to these pages which mention the title of your page. Users/JaimeRaba jr

20050530 12:26:37 nbsp When you rename a page it should somehow take the history of the prior page with it.  Otherwise its too hard to see prior versions, or know where a page came from.  Or as a quick fix, how about a link on the info page to info page of the prior page.  Right now the only way to find the old page history it is to find the old page in the recent pages, click on diff (so that way you dont get autoforwarded), and then click on info.  Users/JaimeRaba
   This is what it used to do and it causes many problems.  For instance, what happens when I rename a page to a name that was once a page, but is now deleted?  The history of the two pages could have been developing in parallel and so merging their history would basically just create nonsense. Users/PhilipNeustrom
    What about a link to the old history?  Its pretty hard to get to otherwise, as I indicated above. Virtually impossible, if you dont know the name of the old page and its not in the recent changes anymore. Users/JaimeRaba
     In Info it says the page it was renamed from or to, respectively.  Do you want a link directly to the page in question?
       Yes, because how are you going to get to the info page with the rest of the history?  (C.f., adventures.)  If you go to the old page, it will autoforward.  You could manually adjust the URL, and that, at present is the only option, unless you go through the recent changes, and do the diff and then do info.  Users/JaimeRaba jr

20050621 15:59:12 nbsp Would it be possible to create a page that shows recent and/or popular search terms?  A page like this would be useful in helping wiki gnomes steer new page development towards the interests of the ungnomish. Users/CarlMcCabe

20050625 16:25:08 nbsp what is the {{{<(>}}} markup, as seen on the colleges? Users/ArlenAbraham
   wiki:wikispot:Help with Tables

20050714 14:13:53 nbsp when you make redirect pages, the preview should say {{{<!>This page redirects to page Page Name}}} Users/ArlenAbraham
  I still think this is a good idea and would like to see it in Sycamore. Anyone else?  Users/ArlenAbraham me again


question that seems like this is the place for.  every time I log out, I cannot login.  my password is never remembered.  any suggestions on how to make this feature work?  Thanks! Users/rocksanddirt
 20050719 13:41:56 nbsp you need to turn on cookies for davis wiki. how you do this depends on your browser. Users/ArlenAbraham
  Cookies are on.  if I dont log out, im fine.  even quitting & shutting down the computer.  it is when I log out that it forgets my password.  Also, how do I get the timestamp on comments like this?  sigh  I feel like such a lamer today.  Users/rocksanddirt
  20050719 14:08:51 nbsp The cookie is deleted every time you logout.  Enter what you want to write in the comment bar above and it will automatically timestamp your comment. Users/MiriamKaufman
  20050719 16:02:12 nbsp Have you checked the Box in User Preferences that says remember my information? Users/BrentLaabs
    20050719 16:10:57 nbsp thanks for the help everyone.  Ill keep at it....and make sure ive got the save my info box checked. Users/RocksandDirt
      Did you ever fix this problem?

20050801 16:33:20 nbsp if you look at the revision histoy for noodle express it shows the orginial editor as {{{none}}}. whats up with that? Users/ArlenAbraham
  I fixed that pages revision history & thanks for the headsup.  It happened because it was an oldold style pagename (NoodleExpress) and we didnt do things right way back when we did the conversion, so the author/comment info was lost in some cases.  Users/PhilipNeustrom

20050804 20:12:59 nbsp There are two versions of the Sustainability page. The second one has two spaces at the end of the name. How does one get rid of the second copy? Users/JasonAller

20050807 22:00:08 nbsp if someone does three (no comment) edits in a row, something giant and red should remind them to preview Users/ArlenAbraham
   Might I humbly suggest Users/BarnabasTruman?  Users/JabberWokky jw
    Brilliant!

20050825 00:26:32 nbsp I had a long detailed question, but ill put up the readers digest version: How does the RandomQuote:People macro work exactly? Users/MichelleAccurso
 20050825 03:26:54 nbsp The macro just grabs a random bullet point from the page. Users/MikeIvanov

20050825 19:51:53 nbsp Sorry if this is written somewhere else, but how does one move a picture from Mystery Picture to Mystery Picture/History? Users/CraigBrozinsky
 20050825 20:24:24 nbsp As far as I know, youll have to save a copy on your hard drive, upload to Mystery Picture/History, and then delete the one under Mystery Picture.  Make sure to look at General Page info under the info tab. Users/BrentLaabs

20050901 12:48:58 nbsp I know that a page linking to itself generates no link, this is still the case when that page is used in another page with the include macro.  In that case, it might be nice if it generated the link.  I know the link could always be put on the page doing the including instead, but if its not too hard of a change, it might be worth making for the flexibility. Users/JevanGray
    This is still outstanding.

20050901 13:01:52 nbsp To facilitate searches, is there a way of creating a thesaurus that can be linked to the search function. For example, porn, porno, pornography, adult movies, adult videos, debbie does davis dont bring up the same pages. Users/CraigBrozinsky

How about we make the default behavior for {{{person@site.com}}} be the same as that of the {{{MailTo}}} wiki:wikispot:Help with Macros macro?  Then we can do away with the unnecessary wiki syntax whenever theres a displayed email address?
 yeah, i dig it  Users/arlenabraham arlen

20051009 23:24:12 nbsp I know how much everyone hates interwiki linking, but I dont like the way theyre parsed sometimes. Say I want to make a wikipedia link to Jägermeister. I would have to enter {{{wiki:WikiPedia:Jägermeister Jägermeister}}} which parses like so: wiki:WikiPedia:Jägermeister Jägermeister. Wouldnt it make more sense just to enter {{{wiki:WikiPedia:Jägermeister}}} and have that look the same way rather than like this: wiki:WikiPedia:Jägermeister? Or even simpler {{{wikipedia:Jägermeister}}}? Users/ArlenAbraham
  I agree that the syntax is terrible.  How about {{{nameofwiki:name of page}}}?  So, if you wanted to link to Rochester Wikis page on Rochester, youd do {{{RocWiki:Rochester}}}, etc.  It seems to make the most sense given that we treat pages in the wiki with quotes and pages to the web without quotes (because we usually have long urls and dont worry about spaces).  If we can just decide what we want then I think nearly anything is better than the current system.  Also, it would be nice if there was a page in the wiki called, say Interwiki Map where people could add wikis, etc. Users/PhilipNeustrom
   I like your quotes idea, I hadnt thought of multiword wiki pages. We dont link Davis wiki pages with underscores, so why use them on interwiki? Im just a little irked by the look of a colon followed by a quote, but i cant think of anything better. Did we decide on a syntax for linking to an anchor on another page? Perhaps they should be similar.  Users/ArlenAbraham arlen

20051010 12:48:32 nbsp Hi guys  I was just wondering if there was a reason the wiki wasnt specifically incorporating or advertising the text book lookup program thats hosted on the daviswiki server? Users/MichaelGiardina
  It wasnt a Davis Wiki project.  I just hosted it on the same server because I didnt have anywhere else reliable to put it.  I wouldnt want to artifically inflate its possible value by making it more prominant than it would otherwise be if it was made by someone not associated with Davis Wiki.  Also, not everyone on the wiki is a student! Users/PhilipNeustrom

20051011 13:05:44 nbsp The event board is weak. I assume this is just a lack of labor to improve it. It should have start and end event times, cost of event, who can go (students only, public, etc.), event reference (URL, newspaper page, etc.), be editable/revertable like other pages, and past events should be viewable too.
  Why is the Event Board not editable? Is this for technical reasons or for policy reasons?
  I notice when the infamous JasonCash hit the Events Board, it was cleaned up without any trail. I assume Philip had to do this from the shell? Users/SteveDavison
    The reason, as you suspect, is technical.  Recent changes doesnt log when events are deleted as its usually only the poster who can delete events.

20051011 13:56:38 nbsp For the restaurants template, there could be an area for the type of payment options they have. i dont know if anyone would actually want to import this info, but this info is currently on one of the citys web pages Users/CraigBrozinsky
  That would probably be general enough for the Business Template (of which Restaurant Template is a subclass).

20051020 10:15:11 nbsp Im noticing enough similarities on these linkdumpers that maybe some kind of a filterscript could autorevert these pages after a specified period of time (so they wont notice they page deletion and go away). Users/JaimeRaba

20051022 17:10:22 nbsp Install NTP to keep the server time set right. It is currently approx. 7.0 minutes fast. Users/SteveDavison

20051030 20:02:18 nbsp do commented lines (ie {{{## comment}}}) show up in searches? Users/ArlenAbraham
  Yes.  Dont use it for keywords or anything because thats a bad idea.


20051105 00:22:21 Just a note, that any links on the wiki that link to outside ucdavis library resources may now be out of date and link to 404 not found. An example is the Ask Now service on Medical Services. These resources likely still exist, but the whole lib.ucdavis.edu service was reorganized... meaning we might need to do some work on refinding them whenever they come about.
   I say someone writes a crawler and finds the broken links and puts it on a page called Broken Links.   Users/arlenabraham arlen


20051106 12:10:00 Im not sure how the nospam macro works, but would it be more effective to have the email addresses turned into PNGs, or would that just create clutter?  Users/arlenabraham arlen
   PNGs dont scale as font size increases. Usability!  Users/TravisGrathwell
    SVG then?
     SVG isnt yet a widely enough adopted standard? Might be a solution later on.


20051115 Proposal: When making a comment in a comment box... the text explanation of your change in the Recent Changes tab simply reads, Comment Added. Can we change this to Comment: FIRST LINE OF COMMENT (cont...) ? This will perhaps spark interest in those who would otherwise ignore a comment.

20051117 10:12:19 nbsp Proposal: Under recent changes, highlight those pages in which the user was the previous editor. In other words, if I edit pages A and B, I am especially interested to know when someone edits them after me as it is more likely to reflect my edits than at any other time. These could be bold, colored, or in some other way brought to the userss attention. Perhaps even a separate tab showing edits of my writings. Users/SteveDavison

20051126 02:46:05 nbsp Can BR have a clear option or is there some other way to have a br clearboth style tag?  Witness the stacking in The_Posh_Bagel?actionrecall&date1132995500 Users/JabberWokky
  {{{ }}} (blank section heading) does this, but can sometimes be avoided (see my edit)

20051126 02:47:57 nbsp Also, the latest version in the info page has no date.  Is that a technical limitation, or can there be an absolute reference so people can copy the latest revision url specifically for reference (rather than whatever the current revision is url)? Users/JabberWokky
  Good idea!
     You can use the url with version<current version number> for now.  Its not in the UI, though.


20051202 02:23:10 nbsp As people add and delete pages, its interesting to see the number of pages ebb and flow around 6000. I added up the number of pages from the User Stats page, and it only added to 5548 (#images is 5587). Are the other 452 code or something? Also, if we can trust the 6000 figure, a polynomial fit of the growth rate (#pages  0.0061daysdays + 9.0142days) suggests well hit 700 by mid to late january. okay, back to work ... Users/CraigBrozinsky


20051202 21:21:27 nbsp to add to the list of a billion more important things, it would nice if disambiguation pages were filtered from the orphaned pages page. Users/CraigBrozinsky

Anchor(SSL) 20051210 00:59:50 nbsp Id dig it if the logins were done over an SSLencrypted link. Users/GrahamFreeman
  I can turn on SSL for apache.  Questions:  How do I have it just use SSL for the login?  Is it okay that I dont have a key for the site? Users/PhilipNeustrom
     mod_rewrite rocks my world.  Put something like this in your nonSSL {{{<VirtualHost :80>}}} section:

{{{
 <IfModule mod_rewrite.c>

   RewriteEngine On

   RewriteRule ^/User_Preferences(.) \
     https://www.daviswiki.org/User_Preferences$1 NC,R301,L

 </IfModule>
}}}

This will redirect HTTP requests for /User_Preferences (or any other path justifying an encrypted connection) to an HTTPS connection.  Youll also want to do the reverse (redirect /Front_Page and other nonsensitive pages from HTTPS to HTTP), unless youre cool with the added CPU and bandwidth needs of encrypting all connections.

Youll want to generate a selfsigned SSL certificate, or (ideally) use one from http://www.cacert.org/ www.CACert.org.  If youre not sure how to go about doing this, we can meet up at Mishkas or Roma or something and get it done.  Ill be back on Sunday.  Users/GrahamFreeman

  CACert doesnt have a valid root certificate on this machine/browser.  Do they have them anywhere?  Whats the point of getting your SSL cert cosigned by them?  Users/KennethWaters

     cuz DavisWiki.org is a community effort, and CACert.org is more of a community effort than Thawte.  And its free.  And its better than what weve got now.  And this isnt a bank  the only confidential information on this site is authentication information.  Besides, by encouraging DavisWiki.org users to install the CACert.org root cert on their machines, we help to improve and facilitate that worthwhile and likeminded effort.   Users/GrahamFreeman

        Sure it sounds good on paper, but as it turns out there is no way to safely install a rootcert, unless its cosigned by some other root certs.  So cosigning by CACert.org doesnt actually provide any more security than selfsigning.  Further CACert is not audited, using it could, in theory, be compromised and less safe (in the sense that it provides a false sense of security).  Those two things combined should encourage people to not install the CACert root cert, unless you can somehow verify the fingerprint.  Users/KennethWaters

         So, lets help to audit CACert or host inperson GPG signature parties or otherwise help to improve the process instead of dismissing communitydriven certificate signing/verification efforts as being useless because theyre imperfect.  I absolutely disagree that this would lead people into a false sense of security  I think itd be just the reverse.  Because selfsigned certs are so prevalent, folks are all too willing to click past the warnings they encounter when they encounter a site that uses selfsigned certificates.  And with selfsigned certs, theres no verification whatsoever.  However, when using a commonlyused yet noncommercial authority such as CACert.org, one cant help but learn a tiny bit about the way this stuff works, which in turn helps to encourage better practices than simply clickingpastthatpeskymeaninglesswarningmessage.  Users/GrahamFreeman

20060105 21:46:59 nbsp Note: Wikipedia.org uses CACert.orgsigned certs.  See https://wikitech.leuksman.com/view/Server_admin_log, which is linked from http://meta.wikimedia.org/wiki/Wikimedia_servers Users/GrahamFreeman

20051210 03:02:26 nbsp If we are worried about security, can we salt the password hash?  Im unable to follow the entirty of the password handling in a quick audit, but I can tell that they are not salted.  Lets not be like mediawiki, instead lets be responsible. Users/KennethWaters

20051225 20:28:05 nbsp There should be a way to revert renames. Right now you have to rename the page to what it was and delete the useless redirect. One of the reasons wiki works is that its just as easy to vandalize as it is to fix vandalsim. Users/ArlenAbraham
 Lets say someone changes the name of A Page in The Wiki to Page X. To fix the problem, one would have to:
  1. delete A Page in The Wiki
  1. rename Page X to A Page in The Wiki
  1. delete Page X.
 It currently takes three clicks to rename a page.
     Just on the subject, there should be a way to revert image deletion/renaming too. Fortunately, weve never had to deal with severe vandalism, but what if? (What if a few people tried for 30 minutes to do as much damage as they possibly could? Ideally, we would be able to keep up realtime. Could we? This has not been tested.) Users/SteveDavison
      I could help you test that.  laughs maniacally (I do like the idea of image reverts though.) Users/BrentLaabs
       Steve: Im pretty sure the image revert thing will be implemented in Sycamore.  Users/ArlenAbraham
        Yeah, it is.  Im not sure what to do about renaming.  Is it a big deal?  The problem is that its easier to rename than it is to unrename.. Any suggestions?  Turning off renaming and forcing manual renaming seems backward because a lot of people wouldnt be able to figure out how to do it on their own.


20060221 01:46:45 nbsp Pages that I cant edit, such as Recent Changes have the same please login to edit message as when im not logged in. it should say something like you do not have permission to edit this page Users/ArlenAbraham

20060315 01:13:23 nbsp Has anybody run validator.w3.org on daviswiki? Users/NickSchmalenberger
  Yes (it fails).  Sycamore (the new code), passes validation as HTML 4.01 Transitional, however (at least the last time I checked it, that is.  Its a goal, at the very least!) Users/PhilipNeustrom

20060320 18:44:16 nbsp Maybe some sort of anniversary macro. Anniversary(yyyymmdd) would output the number of years since that date. Good for automatically updating the content of the page without editing. Users/JasonAller

20060328 11:27:14 nbsp The spell checker is really whacked (OK, we all knew that). Among other things, it includes question marks, but excludes apostrophes in its tokenizing. This is backwards. Users/SteveDavison
  Yeah, it does suck.  I havent touched it.   Users/PhilipNeustrom

Two things. First, how does one add a time tag to an entry, e.g. to preface this message? I used to copy the time tag written above the edit frame, but it has dissapeared. Also, Id like to maintain my #pages predicting equation, but Im not sure how given the new version of the page counter which reports abnout 1000 pages fewer than the previous version of the page counter. Is there any documentation on the discrepancy? Users/CraigBrozinsky
   The time thing is something Id never considered.  When I really need to write the time I usually look at my computers clock.  The miscalculated old pagecount is an interesting case.  It turns out that MoinMoin stored versions of pages on every preview (inaccessible to the user), and we didnt know about this.  So when we made the pagecount mechanism take advantage of the technique we were using for caseinsensitive links we didnt throw out these previewversions.  This is why the count is so many pages off.  Every user who had ever previewed a page contributed to the page count.  The page count wouldnt fluctuate, however, because these preview pages are never actually deleted.  As for predictions and so forth, this may actually make it more interesting because you have to factor out the growth of the editing user base from the previous figures. Users/PhilipNeustrom

20060518 23:07:23 nbsp events.daviswiki.org doesnt lead to the events board. does anyone else ever use this? Users/ArlenAbraham

20060518 23:09:15 nbsp The search function shows highlighting for title matches. for example, if you search technical discussion, and then click on the first title match (this page) theres a little box that says highlighting off even though nothing on the page is highlighted. Users/ArlenAbraham
  Word, ought to be fixed at some point.

20060518 23:24:26 nbsp The Edit/Info/Talk buttons are not displayed when viewing a diff Users/ArlenAbraham
   Intentional.  Click the tab to go back to the page (this didnt use to work).  This is to give more room to the title area because the Differences for takes up a lot of space.  On 800x600 this leads to wrapping on tons of page titles with the icons.
       What about changing Differences to Changes or some such shorter word.  Did we discuss this already?
            Yeah, this is probably a good idea.  Heck, we could change for to on and cut an extra letter out there, too!

20060604 12:05:06 nbsp Why does the wiki care about filenames (like case, three letter extension) of uploaded files? It seems like people have had problems with case of their extensions and the response was make the wiki caseinsensitive, but Im curious why it needs to be case anything? Why not just allow any filename that unix allows? Users/NickSchmalenberger
   Because thats the way it is, basically!  If you really want to know the reason, its because PostgreSQL is case sensitive (this is something that varies depending on which database you use) and to make it caseinsensitive (properly) we need to code around it.  Also, Im not really sure what you mean with your comment.  Are you saying we should be casesensitive?  I disagree, if thats what youre saying.  Users/PhilipNeustrom


20050209 13:24:08 nbsp Itd be sweet if the events from Regular Events were automatically added to the Events board. Probably not an easy task though. Users/JackHaskel

20050321 18:47:50 nbsp Any chance of a WAP/WML interface for advanced mobile users? Users/TarZxf

20050127 23:58:46 nbsp It would be nice to have the option to add ending times on the events board. Editing entries would be cool too.  Users/JackHaskel

20051016 20:44:05 nbsp Is there a way to turn off the Comments section when making an edit? I sometime confuse the Reasons for Change section with the Add Comment section of a page. Users/CraigBrozinsky

20051027 22:27:06 nbsp Have a page which is sort of a cross between Recent Changes and the Info diffs. In other words, create a function which will give the diffs (just the diffs) of all the pages changed since the viewer last cleared. This would quickly allow everyone to see whats been happening without having to view each of the pages. Malicious activity would be instantly seen this way, too. Users/SteveDavison

20051125 19:33:05 nbsp Have the wiki generate a separation line between diffs and the actual page content when using Info>diffs. This will make it easier to see where the diffs end and the page begins. Users/SteveDavison

20051125 19:35:15 nbsp Have a sort of macro which would expand (upon Save page) for date and name. For instance, if I write %d it would expand to the current ISO8601 datestamp, and %u might expand to Users/SteveDavison

20051125 19:38:41 nbsp This has been said before, but Comments should show the start of the text under Recent Changes, instead of Comment added. Users/SteveDavison

20051125 19:40:53 nbsp The Please comment about this change field should be longer. Encouraging more detail is a good thing. Users/SteveDavison
  I think the current size is fine.  Recent Changes would be even harder to read with multiparagraph explainations for edits that should more properly go elsewhere.  Edits are best discussed on the page itself, User pages, or Talk pages.
    Actually I was thinking about 50% longer, say another 40 characters. At least make the input box smaller to reflect the allowed size.

I propose that a tab called Events be created going directly to the Events Board. Users/SteveDavison p.s. I dont know why the comments macro was removed from this page Phil?
  Ive also wondered why theres no events tab. That would be nice. If youre worried about too many tabs, you could get rid of People. Even better, let the users choose their tabs. Steve, I think the comment bars were removed because people were using the comment bar for conversation rather than threading (like Im doing). However, a time stamp button would be nice as well.  Users/arlenabraham arlen
    I agree, I never use the People tab, but I frequently check the Events Board by going to the Front page and clicking Events. Since the Events system works differently than the rest of the Wiki, it especially deserves its own tab. On the subject of Events, one cannot use Info to view recently added events. It would be nice if it worked somewhat like Recent Changes in that it would remember which Id seen and allow me to view only new events.

    Its true that comments can be abused, but its nice in that it gives a Wikiaccurate (ahem) timestamp and author attribution. For new proposals this especially makes sense. Its also easier to spot new comments when they are at the bottom otherwise one has to use Info/Diffs. We have to trust that people will thread properly when commenting on earlier proposals. Im adding it back in for another go. Users/SteveDavison
     Dont forget that you can always click the diff icon on the recent changes page to see the diffs.  Users/arlenabraham arlen

20060410 17:27:43 nbsp Itd be great if submissions that match certain strings of text (geek translation: regexes) were automatically flagged for administrator approval before being made publicly available.  Similarly, itd be great if there was a similar list of words to screen from the Recent Changes page.  This would help to stem some of the less productive debates/flamewars/revertwars that weve seen lately. Users/GrahamFreeman
   So long as they are limited to one or a couple entries, they arent anything other than annoying.  We can bookmark a page (and soon will be able to view recent changes of just bookmarked pages), but the opposite of a Bookmark (a usenet style killfile: a flag to ignore edits on this entry) option would be an excellent idea.
    Define they, please.  They  the counterproductive edits?  Or they  the moderationinducing strings of text?  Graham
    BTW, credit for the better idea is due to PN.  I just chose to put it on this page.  Graham

20061016 21:02:19 nbsp can we put a cap (or scaling) on image sizes in the events board? its full of oversized show photos and i cant edit other peoples events to scale them down. Users/ArlenAbraham

20061228 16:26:16 nbsp How do you find revision info for pages that have had their case changed? See Gill Users/ArlenAbraham

20070212 17:53:33 nbsp i realize alexa is kind of a crock, but http://www.alexa.com/data/details/traffic_details?q&urldaviswiki.org/ daviswiki traffic jumped enormously in the past month. any ideas why?  Users/CraigBrozinsky
  The Flashmob UCD flash mob page was popular on http://www.digg.com/offbeat_news/Yesterday_s_flashmob_at_UC_Davis_LARGEST_IN_US_HISTORY_700_People Digg at about that time.  Users/GrahamFreeman

20070212 19:21:14 nbsp One feature that I miss from the wiki before sycamore was seeing the size of edits. What was the reason this was taken out? Users/NickSchmalenberger
   Its really slow because it just grabs the page text for all of the pages and then counts the length of them.  We can make it work so that its not a performance hit (by storing the size of the page someplace), but the way it was implemented before didnt seem like that good to begin with (meaning:  well redo it later and make it right).

   You have all the pages stored in MySQL right? In strings or something else dynamicy texty I suppose? I dont know about MySQL, or even like it, but is there a way to get MySQL to tell you the size of the record? This seems like the sort of thing that a database should be able to do. Maybe like in this thread (on oracle): http://forums.devshed.com/coldfusiondevelopment84/howtogetsizeoffieldfrommetadata187137.html  Users/NickSchmalenberger

20070322 10:40:34 nbsp I notice that the pages deleted files button seems to have disappeared from the files tab of some pages. Is this true? For what reasons? Users/NickSchmalenberger
  If your recent test on your page failed, its intermittent (oh joy!). http://img239.imageshack.us/img239/9171/wikitj3.png screenshot  Users/WilliamLewis wl
  No, it worked for me there too. Are you an admin or something? Maybe only admins can see deleted files on pages besides their user page.
   Nah, Im a regular user. Can you name any pages that you know have deleted files, but the button doesnt show up?  Users/WilliamLewis wl
  On Users/JessicaYang there is a deleted files button, but in recent changes it says Image sparkleducks.JPG deleted.  JessicaYang without an upload of a file of the same name afterwards, but the file by that name is in the regular files area, not deleted. Anyway, maybe it is due to a file being replaced by a file of the same name or being permanently deleted. If it is permanenly deleted, I would like to see some sort of log of when permanent deletions occur and what files are included in that.  Users/NickSchmalenberger
      Oh!  Yes... thats what happens when somebody uses Replace File.  Ive noticed that myself.  Its not the most clear Change in RC (like renaming entries... which at least give a known comment prefix) Users/JabberWokky
       Uploads and deletions should also be visible in the info of a page, not just in recent changes. And like I said, in JessicaYangs case, it doesnt appear to me (looking at recent changes) that a replacement file was uploaded for sparkleducks.JPG. The last thing about that file is that it was deleted, and yet it is in the regular file area.  Users/NickSchmalenberger

The image isnt listed in Pages deleted images because its currently marked as active on the page.  The older versions of the image are on the page for the image  see http://daviswiki.org/JessicaYang?actionFiles&doview&targetsparkleducks.JPG here (under File History).   Users/PhilipNeustrom
 Okay, the file history feature pretty much answers all of my questions. although it would still be nice if there could be a unified page history to see. I didnt know about that before, awesome. Thanks.  Users/NickSchmalenberger
     Yeah, I agree.  Its a bit more intensive, but its possible.  The problem is actually UI.  Right now the page history area is dedicated to letting you compare differences between versions.  That UI doesnt fit with the idea of there being files and map points on there, and would probably be confusing to most people if it was stuffed together.  That unified UI works on the Recent Changes page mostly because its sort of a log, rather than an interface into the differences between times.  If you have an idea, please post it!  Users/PhilipNeustrom

20070403 23:48:43 nbsp quick edit it amazingly cool. can you make it compatible with pages accessed via the changes buttons on the recent changes page? currently that wont work. Users/CraigBrozinsky

     Yeah, we can totally do that.  I didnt think of it at the time.   Users/PhilipNeustrom

20070626 22:06:26 nbsp EVENT BOARD>ICAL?  For the Event Board, has anyone succeeded in using some dynamic ical generator to life the events data into ical format which would be excellent for virtually all calendaring systems, including the one everyones using these days: google calendar? Users/JaimeRaba
 It should be relatively easy to do, but I think it would require that events be stored as their own objects in the database and the events page be a list of all such objects within a time range. While not a hard concept its not anywhere near how the current setup works. Maybe we should borrow some code from http://www.plone.org plone, Ill take a peak later.
 While were on the topic a few people have mentioned how nice it would be to auto layout the events board so the pics are all a standard size and off to the side of the event info, so no scroll ridiculoso to get past day 5 of some play to find what youre looking for.Users/AlexMandel

20070705 21:18:02 nbsp Does anyone have an idea why Google seems to hate us all of the sudden?  For years Mike and I have been watching our ranking for the search phrase Davis, California.  Weve seen the wiki move up in the ranks over the years, and its always floated somewhere in the first ten pages of results  even from the get go.  In the past two years or so its been consistently on either the first page of results or on the second page.  I just noticed that were absolutely no where to be seen in a search for the phrase, now, which makes me think Google is totally hating on us  but I have no idea why.  The first Davis Wiki result is #227 and its our Volunteer Opportunities page.  What the?

For comparison: were #11 on Yahoo! Search and on the first or second page of all of the other search engines.

Ive noticed that weve been disappeared in http://www.google.com/search?hlen&safeoff&qdavis+restaurants&btnGSearch many http://www.google.com/search?hlen&safeoff&qdavis+kdvs&btnGSearch different http://www.google.com/search?hlen&safeoff&qdavis+the+california+aggie&btnGSearch extremely http://www.google.com/search?hlen&qdavis+outdoor+activities&btnGGoogle+Search relevant queries.  What the..

Looking at our web server logs, it doesnt look like google is even really crawling us any more.  Using googles webmaster tools tells me that Googlebot last successfully accessed your home page on Dec 12, 2006.  No other clues are given in their webmaster tools to tell me why this is the case.

Anyone have any clues?  I put in a complaint on their dissatisfied with your search results? http://www.google.com/quality_form?qdavis,+california&hlen&safeoff area but I have no faith in it being read. Users/PhilipNeustrom

   I have no clues, but it cant be the case that Google hasnt crawled here since Dec.  I searched on my CovertProfessor page, which was created on 4/3/07, and it was in the search results.   Users/CovertProfessor
      Yeah, youre right about that.  Its definitely fishy. pn
      Perhaps a lack of space in the meta tag? just a thought, perhaps contact google about it? I dunno, you can also just pay them, I am sure that would get us indexted :). ~Dave   A space is not needed...

   The only major change to the markup of our pages that I can think of is quickedit. Perhaps the duplication of content in the source is being picked up as some SEO practice or something.  Users/WilliamLewis You wont see that stuff if you cant edit the page  and so the google bot wont see it.

   I would like to lay the blame at the feet of wiki:drama:Jimbo Jimbo (NSFW).  Basically, since theyre marking all of the wikipedia links as {{{relnofollow}}}, and theyre like the only decently sized site http://www.alexa.com/data/ds/linksin?qlink:daviswiki.org/&urldaviswiki.org/ linking to us.  So I say unto you all, go forth and link!   Users/BrentLaabs

20070706 03:28:50 nbsp Quickedit... everything is in javascript.  But is it in Javascript for nonlogged in users (like Googles spider)? Users/JabberWokky
    No, google wont see the javascript string because it cant edit.  See my reply to williams comment above.  So much for that theory..

20070908 19:24:01 nbsp Would be nice if the Search also searched the Calendar/Current Events... Users/GarrettGallegos

im sure this is a basic question for some, but when downloading, what is the difference between compressed source tarball and bzipped source tarball? thanks!
  wiki:wikipedia:Bzip2 bzip is one type of compression that can be used to compress to a wiki:wikipedia:Tar_%28file_format%29 tarball Users/ArlenAbraham

how do i get a copy of the macro that generates the events board? Users/JessicaRockwell

   It is {{{Events}}} but it is useless on any page aside from the Events Board.
      ah. cool. now if id like to look at the coding for the events board, so that events posted can be edited, how do i do that?
        http://www.projectsycamore.org/ has instructions for getting the code. Users/JasonAller
         ok, so i have http://svn.devjavu.com/sycamore/branches/sapling/Sycamore/macro/events.py this page. and i have also found the how to install page. i have a mac, so i have python. do i need to install all the other requirements? and what about those optional libraries? will those be useful for editing the events board?
           Youll need the other stuff, too.   Your python is probably a bit old, so youll need to get version 2.4 or greater, along with the other stuff.  The easiest way to get this kind of stuff on a mac is probably to install http://darwinports.com/ darwin ports.  http://darwinports.com/install/ Darwin ports install info here.  Maybe we should move this discussion to wiki:sycamore to avoid recent changes clutter.
              i installed python 2.5.1 earlier by going to python.org. but to get all the other applications ill go to the link you provided. what about the optional libraries?
        By the way, http://diveintopython.org/toc/index.html Dive into Python is a great python tutorial (language the sycamore wiki software is written in).  The tutorial assumes prior programming background of some sort.  See http://wiki.python.org/moin/BeginnersGuide beginners guide to python links, and http://wiki.python.org/moin/BeginnersGuide/NonProgrammers some tutorials that are suited for people without prior programming background.
        hmm, ive been looking at http://docs.python.org/tut/node5.html this python tutorial. are the ones you recommended better? so ive done some stuff in my terminal...which i know is nothing. but id like to see the actual coding so i can better understand what the hell im doing.
             Any is fine as long as it gets you comfortable with the basics of the language.  #python on IRC is also good for python questions.


Why is it that on the Unitarian Universalist Church of Davis page, when I click preview the text begins at the top of the page perfectly aligned with the image. but in actuality the text begins below the picture? amazed at the mystery Users/JessicaRockwell

   Margin and padding differ between the preview and the real page.
      ah, ok. guess ill have to keep fooling around with it.

20071212 12:18:38 nbsp How come Im not allowed to view Locked Pages? Users/BrentLaabs

   I hide it because it lists the time when the page should be unlocked.  I figured people might set alarm clocks to those dates and then jump back on the entries with that information?  How do people feel about this?
    Oh, I just figured that it was an old MoinMoin page that didnt get deleted because everyone had forgotten about it.  I noticed it on Orphaned Pages.  Yeah, that might be a good idea to keep hidden. BL

20100219 08:16:50 nbsp Would it be possible (and desirable) to set up an email notification system for messages/edits to your own User page?  I ask because it seems all too common for new users to not discover welcome messages, attempts to help, and so on.  I think it would make outreach a bit easier.  A simple toggle in User_Settings, on by default, and using the listed email address ought to do the trick.  Thoughts? Users/TomGarberson

20100301 13:58:19 nbsp I havent seen this in my (very brief) scan of the above comments, but Id be surprised if no one has brought this up before.  When going through a pages edit history (by using the next edit or previous edit button onebyone), itd be great to also have the actual edit comment written up there by differences. It can add a lot of context, and unless youre looking at the info page you wont see it.   For example, http://daviswiki.org/Wiki_Community/Technical_Discussion?actiondiff&version2257&version1256 this edit had the edit log comment of googlygooglygoo.  I understand that this wouldnt be practical (probably) for looking at edits 240 to 260 and have a list of change comments, but is there some way to have that info be added if were looking at consecutive versions? 251 to 252, 252 to 253, 251 to 250, etc. Like I said, it can really help when someone is Real Computers & Free Diagnostics/Restoration Project tracking hundreds of edits onebyone.  Users/EdWins ES
  I would very much like to see this as well.  It would be really helpful to be able to see the changes and the comments in the same place.   Users/CovertProfessor

IP Address Features: It might be handy to have some basic crossreferencing and lookup features for editors IP addresses.  Possibly have either a subpage or a quick list in a users userinfo showing each IP address from which they have made edits, so you dont have to look back through their entire edit history to see the different addresses.  Also, having each IP address link to a page listing each user who has made edits from that IP would be really handy. Users/TomGarberson

20100516 10:22:05 nbsp The systems http://daviswiki.org/Davis_Wish_List?actiondiff&date1274028581 poor recognition of linebreak shifting gets on my nerves sometimes. In that particular edit, I made zipcar into a link, and moved Trader Joes + Car Sharing into the fulfilled wishes section, but you probably wont be able to discern all that without further indepth examination (okay, I also added a few line breaks to make the raw source more readable, which exacerbated the issue). Which brings up a potentially more troubling thought: the systems shortcomings could be (ab)used to make subtle edits.

Solution: steal whatever RegEx algorithm is used by WinMerge, since theyre open source anyway. (halfjoking, but still...) Users/EBT

20100622 16:03:40 nbsp When a wiki page is edited, it may be changed in several places, including in the middle of the page.  We know that a page has been changed from the Recent Changes page.  You can figure out where the page has changed by clicking on info, and then trying to find the appropriate time range.  But the diff text that results is shown out of context with the rest of the wiki text.  Line numbers are shown for the diff text, but wiki text is not numbered, so it isnt clear where these changes actually are.  Furthermore, there may be a series of changes in a selected time range, requiring the user to flip back and forth and search manually for each change in the page context.

A much more efficient way to do this would be to offer a button that combines the time indexing functionality of Recent Changes with the highlighting functionality of Info.  If a user turned this feature on or clicked the appropriate button, the page would be displayed with all changes since they last viewed the page highlighted in color.  Newer changes could be shown with a stronger highlight color than older ones, to make it easy to follow the progress of the changes over time.  The functionality to track the time since a last view is already present in the Wiki in Recent Changes.  The Info button would still be retained for people who want to see changes over other time ranges or prefer the current method.

Optionally, metadata such as the edit time and editor ID could be displayed with the highlighted change, or next to it.  However, in some cases this info is not required, because edits are already often tagged with names and times.

This has the following advantages:
1) 0 clicks required to see how a page has changed  changes are visible inline, all the time
2) No need to hunt for the context of a change.  The highlighting is inline, so the location is obvious
3) More intuitive than the current method, esp. for inexperienced or nontechnical users.
4) Extremely simple interface Users/IDoNotExist

 Making the messages! notice stand out
20101211 12:07:06 nbsp Okay, since there has been some complaints about the messages! notice, Ive come up with a hack that will make it more noticeable.  This is not a code update, just an appearance update.  Just to allow the flip side argument: Would anybody have a problem with my installing an update like this?  Any support for the messages notice as it is now? Users/JabberWokky
 Thatd be great for outreach to new users.  Can you drop a screenshot on here? Users/TomGarberson
  Thanks to Sarahs feedback, I now have three different ones, each with different positives and negatives.  Note that the font size in the Yellow ones could be adjusted... I did those two quickly, based on the first.
  I like option 3! It seems to be the most idiot proof of the three. Users/WilliamLewis
  I agree with WL  #3 is the one that is most likely to get users attention and get clicked on.  cp

Option 1: Orange Tab

   This one is nice when youre browsing.  Distinctive.

Option 2: Yellow Bottom

   Another drawback with this one is that only messages! is clickable, which I dont think is very obvious.  I can make the bar clickable, but then I cant have it say You have.  That, incidentally, is why I left the link blue.

Option 3: Yellow Top

   Pretty much the same drawbacks as Option 2, with the clicking and the text.  These are basically identical except for position.  Without code changes, Im limited in what I can actually do.
 
20101213 11:24:11 nbsp Okay, with very few votes, it looks like number three it is then.  Ive got a meeting in about seven minutes, but Ill make the change right afterwards.  We can always change it in the future. Users/JabberWokky
   I missed this discussion somehow but sometimes the current Messages feature doesnt clear for a cpl times AFTER Ive read the messages. I hope this doesnt do the same thing. Personally I dont see a need to change it.  PeteB
    Okay, thats now one vote no change to two votes for number 3.  Ill hold off.  jw

    Make that three votes for. This at least is a change that can be made without effecting any other wiki spot wiki and has been an issue in need of some change for a long time. Option 3 may not be a perfect solution, but we can at least try it for a week or two and then revert if there is a problem. Other CSS changes have been made during the last sixth months without discussion.  Users/JasonAller
    The issues youre talking about only show up if you have an interwiki presence and you miss one of your userpages that have been changed. The people this is needed for wont have those problems. Those who have those problems are savvy enough to deal with them. Users/WilliamLewis

Three voices for it, one to keep the same, adding the CSS now. jw
   http://daviswiki.org/Users/WanderBee?actiondiff&version24&version13 Im going to count this as positive feedback.  jw

Now that I have seen the look of the yellow banner at the top, I still like it.  Yes, it is big and obnoxious.  But thats the point.  You cant miss it.  People were definitely missing it before.  Yes, it covers up things.  Thats good.  We want people to click on it in order to make it go away, and see the messages.  Often the community is trying to say hey there!  please stop doing what youre doing and talk with us!  So, if it interrupts them a bit, thats what we want.  But  for me, it did not take me to my user page.  Rather, it took me here:  http://wikispot.org/Interwiki_Bookmarks#profiles  Im not sure a new user would know what to do with that.  Im using Firefox, btw.   Users/CovertProfessor

20101223 11:33:52 nbsp Is the bar there until you click on your userpage?  Using both the newest Chrome release and IE9, I see no yellow bar at all anywhere.   Users/EdWins
  Yes, it should be there until you click on your user page, at which point it will go away.  cp
    After this edit, I cleared recent changes and am logging out  mind trying again?users/edwins ES
         No go.  Maybe JW can shed light on it? Cleared cache and everything...  These two screencaps are using the newest Chrome Release on W7.  Image(prelogin.jpg, thumbnail, 200, prelogin, showing some of recent changes)   Image(post.jpg, thumbnail, 200, postlogin, showing all of the changes since cleared/logged out) users/edwins ES

           It should appear while (time when you last visited your profile < time when your profile was last edited), with a note that there are a couple other things that can affect it (mostly having to do with your bookmarks and settings in your wiki settings).  Im not sure what happens if you remove the bookmark or explicitly unwatch a wiki. ⁓Users/JabberWokky ʝ⍵
                Removed bookmark and both watched wikis.  Logging out/clearing cache. Will relogin in using IE9 later if someone doesnt mind leaving another comment.
                 Ok, I just left you another comment.  I also unbookmarked my own userpage to see if that changes anything for me.  Can someone leave me a comment?   Users/CovertProfessor
                  When I deleted the bookmark to my user page, I no longer saw the messages banner.  When I restored the bookmark, I could see the messages banner when there were changes to my page.  However, clicking on the word messages still does not take me to my user page.  This must be related to jws comment that there are a couple of things that can affect it (mostly having to do with your bookmarks and settings in your wiki settings).  I should add that I did not have this problem with the little yellow flag.  Clicking on that always took me to my user page.  cp
                     (Note that this does not contradict anything anybody has written, its simply clarification): I can absolutely state that the link there is the exact same thing that was there a month ago (with a very small possibility that Mike or Philip snuck in a code update, but they both said they werent working on Sycamore, focusing instead on LocalWiki.  Philip is out of town and semioffline until after the 28th).  Anybody who knows how CSS works can back me up here... the HTML code is exactly the same, only the presentation and positioning is different.  After that, I cant speak to the extreme subtleties of how the link itself work.  All I did was a purely cosmetic change.  That said, there are some funky details when you get into how it works that have caused some questions before.  To make it even more complicated, it is plausible that an account created after April 2007 works slightly differently than those created before (there was a slight change regarding default messaging settings shortly after Wiki Spot launched).  All that said, Ill repeat the one thing I can be certain of: while people might be discovering new things about messaging and how the link works via increased scrutiny, the actual functionality of it is the exact same when you click on it.  The only thing that I changed was the appearance of it (as I only used simple CSS). ⁓Users/JabberWokky ʝ⍵
                      I understand what you are saying about it being a purely CSS change, but all I know is that I am definitely getting different behavior than I got before.  I have no explanation.  cp
             Used firefox to edit my wikispot page, per JWs suggestion.  Worked as expected  I got the yellow banner as soon as I refreshed the page I left open on Chrome.  Oddly, I have yet to see the yellow banner when someone edits/comments on my DW page.  ? users/edwins ES.
               Dumb question  are you going to your user profile (have it bookmarked) as your entry point?  If so, youll never see a notice, as it is cleared BEFORE the page displays (since you are already on that page). ⁓Users/JabberWokky ʝ⍵
                   Its a very valid question, but nope!  Typically I go straight to recent changes.   Yesterday, I actually logged out after clearing changes, cleared browser cache, went to the home page daviswiki.org, then logged in.  There was an edit t my page, but no bar at all (as seen in the thumbnail above).  The only time Ive seen it so far is when I edited my wikispot profile page, per your suggestion.  I was on the recent changes using Chrome, and it just took a single page refresh to see the yellow bar pop up.   users/edwins ES




20101223 12:53:26 nbsp As an aside, this is part of why I did it this way  Im trying to open these kinds of things up to community feedback and involvement.  So feel free to suggest any alternatives.  The original issue was that people werent noticing the messages button because it was too subtle.  There are plenty of ways to alter it (so long as it doesnt require an actual code change). Users/JabberWokky

I truly wish I had logged in earlier this month, stay away for too long and bad things happen. Maybe its just Internet Explorer 8, but I think not (apearance of the screens, maybe, complete redirects highly doubt IE causes this). Heres what Im talking about:



In this image, there used to be a little yellow message alert that would show up next to my name and if I clicked it, viola, boom I go right to my page.  Now though with the change that was made in the next image:




I have no choice but to click this huge ugly bar. I cant even see my name, let alone click it (also note not being able to see the DavisWiki logo).  So, now I click this huge monstrosity, and, all appearances aside (which might be altered by I.E. and other browsers {which one would think is another problem with these types of changes... kind of annoyed at the suggestion of downloading another browser just to use the wiki}) I am now surprisingly enough not taken to my page at all, but am instead redirected here:

 Image(Interwikipage.jpg, thumb)

So now, I have not only had no choice but to click this bar which blocked my name, along with any other options I enjoy such as just clicking the recent changes tab... I am now taken completely away from the DavisWiki altogether and have to click my name in the link on the InterWiki/WikiSpot to not only get back to DavisWiki, but also to my page to see the message(s).  Yes, ugly and annoying, no offense.  I would rather either have this system changed back to the old version (which worked perfectly well) or go to the much less obstructive version. The only other option is to download and install a different browser???  Come on, thats just poopoo talk ... the wiki should be the same for all browsers and I doubt very highly a different browser will cause an Interwiki redirect anyway.  If it does, tell me how.

  It doesnt.  There has been no change to the link itself in the last few years.  The appearance of the link is all that can be changed with CSS, and that was the only thing changed.  The link itself has operated the same way since April 2007, as indicated by http://wikispot.org/FAQ#headb1f45d8a6877dd9e8ba3c5a98db41e182080790b this question from 2008 in the FAQ.  As a final note, I dont believe that anybody has suggested you download a different browser to use the wiki, merely noted that different browsers, operating systems and monitors have slight differences in how they render text. ⁓Users/JabberWokky ʝ⍵
   Ok, I think I am starting to figure this out now.  Assuming JW is right (and surely he is), perhaps what was going on before was that wed seeing the little yellow messages flag right next to our name, but wed click on the name because that was what looked like a link.  The problem with the current solution, and all of the proposed new solutions, is that the messages notice is no longer next to our name link, and so we click on the messages link instead.  I am of the opinion that Interwiki bookmarks is not a good place to send new users looking for messages, but I understand that no code changes are likely to be made.  So, it seems to me we have a choice among the following: 1) the old way: user might miss that they have messages, but if they saw the notice, they would likely go to their user page; 2) the current way: user is more likely to see that they have messages, but also less likely to be able to find the page where their messages are, or 3) some third way where the message flag is made bigger but is still next to our linked user names.  If there is a way to do #3, I think that is worth considering.
       By Jove, I think youve hit on what has been happening!  Ive been wracking my brain trying to figure this out.  Ill bet your observation that people were clicking on their name (taking them to their user entry) is dead on.  It was starting to drive me nuts, because I knew what I had done, and it couldnt have changed the actual links themselves.  By changing the appearance of the links, however, while it didnt change the behavior of the wiki, it did change the behavior of the people using the wiki (i.e., they clicked on the messages link for the first time, rather than their name, and thought things had changed).  For a number 3 option, note the Orange tab option above.  It at least allows people to click on their name, if they are in the habit of doing so. ⁓Users/JabberWokky ʝ⍵
        Thats what Ive always done (clicking my username) whenever I saw I had a message alert. Always let me see my messages on my userpage that way. What I think I am reading here now is that IF someone actually clicked the message link it always redirected to the interwiki link?  That makes no sense to me at all. It just sends you to the interwiki page pictured above and causes frustration (at least it did with me). I wondered why it was redirecting me to a page on the interwiki (where no messages reside, but a link back to your page does) when it makes more sense to just click your name and view the message(s). Clicking the username, while it may not have been the technical thing to do, is the common sense thing to do and what I am guessing the majority does do. I think that whatever tab or link is created to resolve this should still allow the users to click their name, or at least link directly to the userpage rather than to the interwiki. Users/WesP
        Glad I could help!  Its been bugging me too.  JW, the orange tab option allows people to click on their name, but it doesnt tell them that this is what they should do.  Is there any way to tell the new user that?  cp
          Wes: Thats a behavior that has been complained about many times, but Philip defends as being the correct way to handle it.  Maybe Local Wiki will handle it in a more obvious manner, that would be an issue to bring up when the development hits the feedback stage later this year.  CP: I agree, and thus: Does anybody have any problems with flipping to the Orange Tab format to try that out as a way to resolve both issues (visibility and the new confusion)?  Ill wait until this evening unless I get three clear voices of Yes, go do it! (again, Im trying to make sure everybody has an opportunity to speak up in changes like these). ⁓Users/JabberWokky ʝ⍵
           ʝ⍵, does PN defend it?  On the page you linked to above, he http://wikispot.org/FAQ?actiondiff&version2376&version1375 seems to agree that there is a better way.  And you http://wikispot.org/FAQ?actiondiff&version2378&version1377 offer a very good suggestion, IMO, for dealing with the problem.  In any case, I am certainly willing to give the OTF a try, since the YBF seems to be causing problems.  Its not a perfect solution, but maybe it will work better.  ℂℙ
             I know hes defended it in the past.  Its very plausible that there have been other positions over time, and I certainly cant state his current view with absolute certainty. Regardless, there has been a stated moratorium on Sycamore development to focus on Local Wiki development.  Thus this change is an incremental fix to cover the interim.  ⁓Users/JabberWokky ʝ⍵
             I didnt like that what I called the over banner covered up the three links  and with a different link!  The message indicator shouldnt cover up those links and take up so much space at the top of the page.  One possibility would be for the message indicator to have a link for the user page where the message (Maybe someone edited the user page and it isn t really a message.) is and also have a link to the messages page. Users/BruceHansen
                It is the same link, working the same way, as before.  To be clear: No link has been changed in the past few years.  Period.  It works the exact same as before.  You were probably, like several people, it seems, clicking on your username rather than the actual word messages.  No changes have been made to the links at all, except in appearance.  They work the exact same as before. ⁓Users/JabberWokky ʝ⍵

20110318 19:50:18 nbsp Still using this? Users/WesP

20110510 10:47:45 nbsp So, on Monday afternoon I found myself in a small office with light wood floors, two cheap IKEA desks and a couple of $5 sheets of tileboard glued to the side of the wall to serve as whiteboards.  In short, I was in Mike and Philips office.  They gave me a fairly comprehensive overview of what they have accomplished so far in an actual demo of the working software.  While it still has some bugs and a simplistic UI, its pretty clear they have done some outstanding work.  I didnt use it, but over Philips shoulder I was shown that the GUI interface is in place, demoed one of the best mapping systems Ive ever seen, and led through a few other really impressive bits.  We talked tech for a bit, and they are  as they planned to from the beginning  really using the Django framework in a way that should keep things easier to update over time, so long as we have active development of the software.  We also spoke about improving the visibility of their work so that we, the current community, know whats going on, and came up with some good ideas toward that goal.  Ill write up a longer (and more public) overview of my impressions in the next day, but I do want to say that the work to date has been oriented toward a very calculated and clear improvement of what we have. Users/JabberWokky

20130212 12:33:30 nbsp Could there be an app created for the davis wiki? That would be awesome!! Users/JenniferStanton

   The new LocalWiki platform, which DavisWiki will be moved to, has much better mobile support.  E.g. if you check out https://play.localwiki.org (link is temporary and will take a while to load) youll see it looks really good on a mobile phone, and even editing is supported (on iOS 6 and Android).  The new platform also has some technical functionality that make building an independent, yelptype phone app much easier (for instance, a couple of prototype independent apps have been built  https://github.com/hampelm/localwikimobile).  Ive been working to try and get some funding for mobile development as well  http://newschallenge.tumblr.com/post/31273837498/localwikimobile (this particular proposal didnt make it, btw) Users/PhilipNeustrom
   When will the move officially occur Phil? Users/PeteB
