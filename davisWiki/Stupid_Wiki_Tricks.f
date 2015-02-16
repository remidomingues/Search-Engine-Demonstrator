
Okay, so you can do cool, dumb things with the wiki. Its actually really flexible if you want.  For instance, heres a roll of three dice (suitable for your next D&D game);


Reload the page and they reroll.


Oracle

Ive been trying to get a Wiki Oracle going in the same sense as the old Usenet Oracle.  The gag is that you get back really dumb, funny answers.  The trick is a straight question followed by misinterpretation.

The Gateway allows inbound answers:


And the Altar shows responses:


It hasnt taken off like I had hoped.  People keep thinking the wiki is for serious business.  It is.  It is for all walks and stripes and strokes of life.  That means theres more to it than serious business.


Autopopulating Lists

Okay, heres one thats genuinely useful.  I need to writeup exactly how to do it, but theres an example at AAA.



 KDE and the Wiki 

A bit out of date now that rekonq is the new KDE browser, but Ill expand this out at some point.  Theres a lot you can do with lynx and chrome as well.

Konqueror Web Shortcut for the Wiki Search: {{{
http://daviswiki.org/FrontPage?text_new{@}&actioninlinesearch&button_new.x0&context40
}}}

Konqueror Web Shortcut for the Wiki: {{{
http://daviswiki.org/{@}
}}}

Go to Settings, Configure Konqueror, Web Shortcuts and paste the above line and pick a shortcut.  I use dw.  Then you can use URLs like dw:JabberWokky to either jump directly to an entry or to search for the term.


Hidden Text


Want to know how to provide a spoiler or punch line?  Select the following text with your mouse:


Note that on some interfaces (like phones), you may not be able to select text.  Oops.  Failure of their browser, or problem with this trick?  You make the call.

Indented Nonparagraphed Text

Okay, so you have a poem or some other similar text.  You want it indented so it looks like this:

{{{      }}}I  think that I shall never see
{{{      }}}A poem lovely as a tree.

If you have a line break, they are right next to each other, and if you have indented the markup, the text indents.  So you do the obvious:

{{{
     I think that I shall never see
     A poem lovely as a tree.
}}}

But it comes out like this, with a big space between lines (its worse when you have lots of lines, trust me):

     I think that I shall never see
     A poem lovely as a tree.

Why?  Because when you indent, it starts a new paragraph, same as if you leave a blank line between them.  Answer?  Use code markup to force the space, starting the spaces at the first column so they arent actually indented.

{{{
{{{      }}}I  think that I shall never see
{{{      }}}A poem lovely as a tree.
}}}

For the full effect, use the full poem (and attribute!):


{{{      }}}I think that I shall never see
{{{      }}}A poem lovely as a tree.
{{{      }}}A tree whose hungry mouth is pressed
{{{      }}}Against the earths sweet flowing breast;
{{{             }}}  Joyce Kilmer, Trees
