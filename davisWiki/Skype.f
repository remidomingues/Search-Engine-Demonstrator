Post where Skypes https://developer.skype.com/SkypeToolbars stupid browser plugin/toolbar/whatever has mangled pages! We should write up a bug report to send to Skype to end this. When does this occur? Does it only happen in certain browsers? How can we reproduce these problems?

If we recommend that they keep their grubby hands off of stuff inside form elements, should that be enough to solve the problem? Does it break anything else with their plugin? Hmmm.

  http://daviswiki.org/Target?actiondiff&version2186&version1185
  http://daviswiki.org/Adobe_at_Evergreen?actiondiff&version2202&version1201
  http://daviswiki.org/Adobe_at_Evergreen?actiondiff&version2204&version1203
  http://daviswiki.org/Users/jefftolentino?actiondiff&version278&version177 — This one wasnt a phone number... hmmm.
  http://daviswiki.org/Cenario%27s_Pizza?actiondiff&version267&version166
  http://daviswiki.org/Hometown_Chinese_Food?actiondiff&version2378&version1377
  http://daviswiki.org/Helmus_%26_Helmus?actiondiff&version269&version168
  http://daviswiki.org/Alvarado_Sunset_Apartments?actiondiff&version2134&version1133
  http://daviswiki.org/South_Davis_Storage?actiondiff&version222&version121
  http://daviswiki.org/Sang_Tran%2C_DDS?actiondiff&version250&version149

Ive seen a lot of these around, generally on the apartment pages. Never gave much thought. I just http://daviswiki.org/Users/jefftolentino?actiondiff&at_date1274025657.2251999 erased another one (in a user page though, so... not that big of a deal in that case) found via search; as of right now, the search doesnt turn up any more. Users/EBT

Yeah, Ive fixed a few, too  I dont remember which ones.  cp

Ive caught some on several Wiki Spot wikis.  I think they might have been on a bunch of the apartment pages because one of the property management companies updated the entries for the complexes they maintain.  jw

So now that weve got a few examples, how do we contact Skype? Theyre set up to deal with technical support, not people telling them that their software is messing up other websites.  Users/WilliamLewis

I noticed this was http://help.pixelandtonic.com/brandonkelly/topics/skype_toolbar_inserts_code_when_pasting_content_with_phone_numbers mentioned here, http://drupal.org/node/280221 here, and http://forum.skype.com/index.php?showtopic81102 here.  I think our best bet is to make a prominent post on the skype forums.  http://forum.skype.com/index.php?showforum221 This forum is probably the right spot.

We can also add this to the editor HTML here to make it stop happening (apparently):

{{{
2. You can enter the following meta tag in your html:
<meta nameSKYPE_TOOLBAR contentSKYPE_TOOLBAR_PARSER_COMPATIBLE />
If you do, then ONLY phone numbers within the following tags will be highlighted:
<! sphoneid telnr+15551234456 fileasJohn Smith >(555) 1234 456<! sphoneid >
Hope that helps!
}}}
