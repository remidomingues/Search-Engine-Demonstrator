Today (2006517) Davis Wiki underwent the most substantial software and backend change in its history.  For nearly two years now the Davis Wiki has brought information, entertainment, knowledge and a true sense of local touch and love to Davis.  As we move forward as a resource we must also strive to move our tools along with us  and we have.  Davis Wiki started over some burritos at The Guad and has turned into a terrific resource that is seen by thousands daily and has impact far beyond even our own community here in Davis.

Image(server.jpg, thumbnail, Davis Wiki server hosted by Cernio, right) Today brings a major update to the software behind Davis Wiki as well as a move to our very own dedicated server.  We hope that the update is comfortable, intuitive and enjoyable.  Our goal in our development has consistently been to improve the usability of Davis Wiki with the explicit aim of making the best resource in the world for our community  and giving it all away for free.

So, whats new?  Aside from the slightly altered user interface, the most substantial changes occur behind the scenes and affect things that you cant directly see.  A number of features and fixes that have been asked for time and time again have been added  but, as always, there is still much work ahead for us.

Images now come with much more information  who uploaded them and when, as well as a full version history of each image.  Pages now contain more information on whos edited them and the differences between pages have been made more clear and easy to navigate between.  Wiki users accounts (in Info) contain information about the edits made.

Weve also made it easier to keep track of what you find interesting on the wiki.  wiki:WikiPedia:RSS_%28file_format%29 RSS feeds have been improved at all levels  pages feeds now include full differences and every page on the wiki has a specific feed associated with it.  The Bookmarks functionality has been improved to alert you when a page on your list has been altered, and the RSS feed for your bookmarks page is a list of changes to the pages youre interested in.

I hope that you enjoy the many changes (and hopefully improvements!) weve been making.  Viva la wiki  heres to the next two years and beyond!

  Users/PhilipNeustrom Philip Neustrom and the rest of the Wiki Developers

 Special thanks 

A special thanks goes out to the following individuals who have continually helped out above and beyond the call of duty, often for little or no food or bribes (except for Zac who bought lots of pizza), to make this current update (no matter how broken it may actually be!) possible in some shape or form:  Users/DavidReid David Reid, Users/JasonAller Jason Aller, Users/MikeIvanov Mike Ivanov, Users/AmitVainsencher Amit Vainsencher, Users/GrahamFreeman Graham Freeman, Users/TravisGrathwell Travis Grathwell, Users/ZacMorris Zac Morris, Users/GonzaloEyzaguirre Gonzalo Eyzaguirre, Users/ErikAnderson Erik Anderson, Users/ChrisTakemura Chris Takemura.

 More specifics 

The most important  and perhaps only  change you need to be aware of is that the former {{{attachment:}}} and {{{Thumbnail}}} ways of adding an image to a page have been replaced with a single {{{Image}}}.  For more information see wiki:wikispot:Help with Images.

Edit locks are now gone and edits are merged together when they occur at similar times.  User Statistics is now sortable and Orphaned Pages & Wanted Pages filter users pages and socalled redirection pages when necessary.

Macros, which are things like {{{BR}}} and {{{Image}}} which perform special functions, are now case insensitive  so {{{image}}} works just as well as {{{Image}}} does.

Every page now has a link to an associated Talk page.  This is an experimental feature which is (admittedly) turned on because we want to show off our new icons in all their iconic glory.  The Talk page is for discussion and debate about how the Article page should be improved or altered, when appropriate.

The page count on Davis Wiki, which was formerly 7165, is now accurate (but lower).  This is due to some bugs in the old software we were using.  The Interwiki (ways to link to other wikis) list is now editable by all users and can be found at Interwiki Map.  Links and formatting now work in footnotes.  {{{TableOfContents}}} now can optionally be {{{TableOfContents(left)}}} or {{{TableOfContents(right)}}} for more page beautification.

There is now a Signature button in the Edit area.  Pressing it will put your name in the usual format into the page text.  The editor interface has been cleaned up to give more room to the editor itself.

There is a new {{{LinksHere}}} macro, with optional {{{LinksHere(pagename)}}}.  This gives a list of pages that link to the given page.  This is useful for doing basic categorization.  For instance, {{{LinksHere(Photo Request)}}} gives a reasonable picture of pages that wish for a photo.

As always, there are bugs we dont  and cant  know about until the site is hit with thousands of visitors.  Things will probably break here and there.  Bug Reports Let us know about any problems and we will work to fix them as soon as we can!

Oh, and you can also now give a reason when you revert a page, so revert wars will look a little less stupid.

Bug Reports now get filed at Wiki Spot, but we still have the list of Bug Reports/Old old ones here.

 Super technical stuff 

Most significantly we have improved our software to make use of a relational database as a backend (if youre interested: were currently using PostgreSQL but weve toggled between it and MySQL because we arent very good at making up our mind).  We have also gone to great lengths to attempt to improve the speed of the software and we are using a smarter caching strategy.

 Known Issues 
   There is some odd behavior with pages showing a version behind the current version.  It happens rarely but it does seem to happen.  Were aware of this and were working on it.
     Friday at 5:18AM some things were changed that may be the source of the problem.  Please let us know if you notice anything like this  an old version of a page showing rather than the current version  happening.


20060517 12:30:05 nbsp Gorgeous. If only the Sisweb developers had your talent! Users/ArlenAbraham

20060518 18:22:35 nbsp Sweet, it looks good man. Keep it up! Users/DatNguyen

20060519 00:48:57 nbsp I like the new pretty buttons.  Esp. the view previous edit link.  Very fancy. Users/AndrewBanta

20060528 20:00:58 nbsp The upgrades are very noticeable, great job!  One issue I ran across was that image userstats dont seem to be updating, or do the values only update every so many days?  Ive added several images, yet my image stats have not changed. Users/DanWillenbring
   I just noticed this as you uploaded some images earlier.  Itll be fixed later tonight.

yay Users/travisgrathwell!!

20060602 15:46:35 nbsp The page count on Davis Wiki is now accurate, you wrote, but where is it?  Users/WilhelmBuehler
  Its at the bottom of Recent Changes.  You can also use {{{PageCount}}} to get the answer:  namely PageCount.
