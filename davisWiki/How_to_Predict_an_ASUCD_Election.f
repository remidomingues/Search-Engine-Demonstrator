I ended up predicting the winners of ASUCD Elections correctly twice in a row, using a simple model of a Choice Voting election.  Okay, the second time, I had a tie for the sixth seat, so I wasnt sure there, but other than that, it went okay.  Since Im no longer at Davis, I thought Id share my findings with the new generation.  Users/BrentLaabs

 The Constituency Model 
The model works like this.  Assume all voters are singleissue voters, which is pretty true for student government.  You need to identify all of the constituencies that will be important in the race.  There are certain constituencies that will always be present:

 Constituencies Always Present 
  Fraternity members  5% of campus, and they vote for early and often for bros
  Sorority members  another 5% for their sisters
  Environmentalists  The Project Compost/WEF/EC/MJ bloc
  ASUCD Internal  Really not a singleissue constituency, this is ASUCD Commissioners and their roommates.  If you dont have a pulse on the insiders, just assume they vote for the slate member who seems least moronic.
  California Aggie Endorsements  tend to lend support to the top 1 or 2 candidates they choose
  Latin@s  will pretty much always be present.
  Conservatives  DCRs endorsement matters.  DCDs doesnt.
  AntiSlate voters  Fuck the slates!  Tends to go to the best spoken of the indies.
  HotorNot Female: See those pictures on the ballot?  Lets vote for the most attractive ones.
  HotorNot Male:  See above.  And yes, people have told me this is how they vote.
  Assholes  do not omit this constituency.  It is vital to making the model work.  They think ASUCD is a fucking joke, and vote for the candidate who is most likely to tell them so to their faces.

 Constituencies that Can Be Present 

  Ethnic Interests: (any)
   Other Ethnic constituencies vote as candidates exist.  AfricanAmericans, ArmenianAmericans, JewishAmericans, and AsianAmericans have been important in the past.  Asians are a very diverse bloc, so be careful about how you think about this one.  This depends a lot on who is running that year.
   Note that just because you can match skin color on the SherwinWilliams chip, does not mean they earn your vote.  Black voters in Davis are not going to vote conservative.
  CalPIRG  if theyre superactive that year; usually just a part of Environment/ASUCD Internal.
  Freshmen: If theres an active frosh candidate.  Often overlaps with HotorNot above.
  LGBTQIAWTFBBQ  depends on the closetstatus of the current candidates.

 Constituencies who can be Safely Neglected 
Neglected for purposes of votes; dont be a dick once youre elected.
  International Students  we dont have this democracy thing in China/Im a citizen of Brazil, so I cant vote here
  Transfer Students  almost always ignorable.  Transfers arent as connected to student life.

 Run a model choice voting election 

Choose 14 of the constituencies that you believe are most important (or more if its a huge election).  Assign each constituency a vote of ½.  That is to say, half of what a candidate needs to get elected.  We do assume that each has a roughly equal strength  and not enough elect a candidate on their own.

Okay, heres where the art comes in.  Assign each blocs vote to an appropriate candidate.  Without proper polling data, youre just going to have to guess by looking at the candidates issues and talking to people in the election.  Sometimes the votes will split between candidates, at either ¼¼, or ⅛⅜, or whatever feels appropriate.

Keep track of who goes where, because youll have to guess transfer votes too.  Run a choice voting election, with threshold  1.

If a candidate has no votes to start with, theyre pretty much always eliminated.  That means that you couldnt find a valid constituency for them at all.

 Sample Election 

For this sample I selected:
  The always present list (minus enviros because I forgot)
  Jewish
  AfricanAmericans
  LGBT
Which is 12 instead of 14 but its just an example...

Heres the candidate list I drew up for fun (dont kill me guys).  Okay, lets run an STV election!


Sonia Sotomayor is elected.  Paula Abdul is elected.   John Roberts is elected, transferring votes.


No candidate has made threshold.  Stephen Breyer is eliminated. Lance Ito is eliminated.  Judge Fudge is too busy being delicious.  Clarence Thomas is eliminated.  Okay, now on to those with votes.


Okay, now people with votes.  No candidate has made threshold.  Ruth Bader Ginsburg is eliminated; votes transferred to Exhausted pile.  Simon Cowell is eliminated, tranferring votes:


Anthony Kennedy has the lowest votes and is eliminated; antislate votes transferred to the Exhausted pile (but ASUCD Internal votes never transfer to Exhausted).  Only three candidates remain for three seats; Bruno Tonioli is elected.  Cee Lo is elected.  Antonin Scalia is elected.

The members elected to the ASUCD Supreme Court are:  John Roberts, Sonia Sotomayor, Paula Abdul, Bruno Tonioli, Cee Lo, and Antonin Scalia.

Okay, I didnt know a priori who would actually win this election when I started writing it but... doesnt that sound like a typical ASUCDtype result?  This method can be extended to the presidential election, but use the senatorial constituencies, and set threshold at 3.5.

 Consequences of the model

When there are only six seats, a candidate must have multiple voter bases to get elected.  To candidates seeking office, developing support among multiple groups before running can help to ensure victory.  Also, a slate that wants to win should run candidates with different constituencies, and avoid overlap as much as possible.



20130318 10:39:52 nbsp So you ran this model recently (Fall 2012 / Winter 2013) or a while ago? Users/MaxwellKappes

20130318 12:58:01 nbsp Oh, quite a while ago.  The problem is, you really do have to have a good sense of the people involved to run this model.  (Or otherwise have polling data.) Since I dont know any current students personally, its hard for me to tell whether say, Users/MilesThomas is a hard worker or not, and what his base of support is.  I ran this in a composition book in the 20072008, and if I ever find that book, I can tell you how those elections went.

But I think there is a lesson here for your model.  Facebook data will overestimate some constituents (especially greek system), while underestimating others (say hippies).  By normalizing the type of support, even to something as stupid as all groups are equal, I got better results.  Since most people are only drawn to vote in elections for people they actually know, the practical limit for votes is the size of ones acquaintance graph.  But if youre representing a constituency, you get to use the largest graph for that constituency. Users/BrentLaabs

20130318 15:50:50 nbsp I started looking at ways to predict the winners of the Winter 2013 election based solely on past election results. As Brent pointed out, without being on campus its quite difficult to predict the actual winners but looking at past election data I was able to predict the gender and slate affiliation of 5 of the 6 winning candidates. The one I got wrong was giving a seat to an Independent instead of a third seat going to NOW. Knowing female Independents dont win, I had the seat going to Roman Rivilis but it turns out he had very minimal support in the election. With three slates on the ballot and only six seats open (a first for an ASUCD Choice Voting election) I thought there was a possibility that no Independent would win but I underestimated the support NOW had and overestimated the support Roman Rivilis had.

I had NOW winning 2 seats, SMART winning 2 seats and BEST winning 1 seat. Since BEST only had one female candidate I figured they would elect a male candidate. I knew 2 to 3 females would be elected (I went with 2) and one would be from NOW and the other from SMART. The remaining two seats I had split between NOW and SMART with each electing one of their male candidates. Basically the seat I had going to a male Independent candidate went to a female NOW candidate.

I looked at Aggie Endorsements as well for the past 10 elections and guessed that only three of their endorsed candidates would end up winning seats, which turned out to be the case.

Someone on campus who used Brents constituency model and looked at past elections as indicators (as I did) would probably have an easier time of predicting winners in future elections. Users/JonathonLeathers

20130318 17:15:50 nbsp My model doesnt exclusively use facebook.  Before the last election my other significant variables were:
Affiliation with SMART (negative, they have a lot of facebook incest)
Aggie Endorsement (positive, shows competence or something)
Living in the Dorms (positive, rains votes)

The living in the dorms variable wasnt a good one though since Paul Min, Bradley Bottoms and Joyce Han (last candidates to come from the dorms) all crushed their election due to other variables (like affiliation with Mustard Seed Ministry or being an RA).

Since this election however only facebook and either smart (negative) or now (positive) affiliation work.  That being said how hard someone tries doesnt really mean anything anymore. Users/MaxwellKappes

20130318 17:48:07 nbsp My initial reaction to this is that it seems very subjective. People on the ground who have a good understanding of how ASUCD elections work tend to be able to make a good guess about who is going to win most of the time. If you want to make a model for elections, ideally you would want it to be as objective as possible. This seems mostly like taking your gut reactions (which are usually pretty good if you know what youre doing) and trying to make it look scientific. Users/DylanSchaefer

20130318 18:22:37 nbsp If Im to base a factor of Who worked the hardest off of how visible they are on campus, how much time they were on campus campaigning each day, and the amount of presentations they gave, in the Winter 2013 election, only 3 of the top 6 hardest workers were elected.  I think you could get away with making it a dummy variable (1 for is among top 6 hardest workers, 0 for otherwise), much like how an Aggie Endorsement would work in such a model.

My econometric model has an awful r² and only correctly guessed myself, Yee, Amrit, and Pamela as winners this time, and has the shame of being largely subjective in its dummy variables.  However, it got the six from Fall 2013 correctly, but in nearreverse order (with the exception of Max being sixth).  Maybe if I make it pretty enough Ill post it here now that this page exists.

In a field of 19 candidates, with 16 of them in slates, knowing what we know about choice voting, I could never say an independent would have won this election.  They simply would not have the amount of #2 and #3 votes to pass threshold.  The problem is this is difficult to quantify in a model such as mine, which goes after 1st place votes, not victories.  Its also harder for independents to have as much broad awareness attached to their names due to the fact that their campaigns must rival giant political machines, the likes of just one of which managed almost half the vote. Users/MilesThomas

20130318 20:16:53 nbsp Ill agree with you that the constituency model is based off of gut reactions.  But it gives you a way of classifying your gut reactions, thinking about them logically rather than simply intuitively.  I find that if you try to predict winners, you tend to pull a Karl Rove and just assume that youre choices will win because theyre obviously better.  This is a way of negating that.

And no, its not very scientific.  There are lots of assumptions: all constituencies are equal, voters singleissue vote, you can correctly guess who worked hardest within a constituency.  But its simple enough even an average polisci major could do it, and in theory you could produce an aggregate model from multiple people trying to forecast this way.

But there are other issues in everyone elses approaches.  Yall are using past data to predict future elections, but how much does the past really apply?  People dont always vote and they graduate, so Id guess that one changes ~⅓ of the voter base each year or more. (Actually, that might be testable.)  Slates change members every year, and their participation changes.  There are virtually no incumbent races.  The data sources that do exist tends to underrepresent entire constituencies. Were not in a numerically rich environment.

Actually, Ill challenge the proposition that the dorms rain votes.  I think that freshmen are less likely to vote, and cast more um, stochastic ballots due to not knowing WTF is going on.  Especially in Fall Quarter elections.  Does anyone have actual data on this?

In the Winter 2005 ASUCD Election, 23 candidates ran on 3 slates, and two independents still managed to get elected.  Sure there were 8 seats open and EFoxy didnt even make threshold... but this ratio is comparable to the 19:16 election described above.  That is, if data that old has any bearing on the current electorate. Users/BrentLaabs

20130318 20:49:04 nbsp As Maxwell stated above, how hard someone tries isnt particularly useful as a factor in determining the winner. Visibility can certainly help a candidate but there is a small return on that investment. A candidate with a large social base of friends and acquaintances could do virtually no campaigning outside of their social circles and be elected. That being said, I can think of numerous elections when I was on campus where some of the most visible candidates/campaigns did not win and candidates who had virtually no visible campaign did get elected. People knowing you are running is one thing, getting those people to vote for you is entirely different.

Also, to Miles point, you simply cannot say that an Independent candidate would never defeat 16 slateaffiliated candidates. The number of candidates in a Choice Voting election has no impact on the threshold for the election. Simply put, a strong Independent candidate can win in any election regardless of the number of candidates whether they are on a slate or not. Even if a candidate doesnt meet the threshold they can be elected without receiving any transfer votes. In an election with a lot of candidates, this is much more likely in fact because so many votes will go to the Exhausted pile.

Also, you are putting far too much emphasis on people voting for slates over individual candidates. It is clear in every ASUCD election that many voters do not simply vote for a whole slate. For instance, of the people who voted for BEST as their first choice only 33% of those voters ranked a BEST candidate as their second choice. Also, in older elections there are examples of Independent candidates having better name recognition on campus than slate candidates, despite the existence of LEAD and Student Focus. I could all but guarantee those two slates had better recognition on campus than any current slates do now because LEAD and SF were around for many years and the current ASUCD slates have been around for a year or less. Users/JonathonLeathers

20130318 21:34:44 nbsp I agree with the statement that past data isnt good enough to try and predict elections... I tried doing so for the last two years and failed miserably each time. Theoretically I think that it is possible, practically, however, it isnt. Turnout, on the other hand, is pretty strictly correlated with candidates, and I think that can be reasonably predicted each election. Users/DylanSchaefer

20130320 02:42:06 nbsp Brent, as I stated previously I was aware that that variable didnt mean much.  It was based off of the stellar performances of Joyce Han (TriDelt, MSM), Bradley Bottoms (RA, incumbent support) and Paul Min (RA, MSM).  Coming from the dorms is just something they all had in common and since I purposely keep my model with recent elections (since if I dig back too far it gets harder to acquire facebook information and the way elections are played out is dramatically different) .  I didnt think it would hold up but it was a strong variable so I just kept it.  As expected it doesnt mean anything after all.  That being said MSM, what was initially considered an obscenely powerful base, was also killed due to the relatively poor performance of Nikki Kim.  Things change rapidly, so I keep my model limited in scope.

The difference between the 2005 election and future elections is how BEST will (ideally) operate.  By poaching strong independent candidates the field of independents not only diminishes but leaves only the weaker candidates.  Because of that independents will be unlikely to win.  This is followed up with the obscenely high thresholds we will be seeing, in which an independent who gets 500 votes would still have trouble getting elected.

On Jonathans point: In this election three of the elected candidates did very little ground work, they invested nearly exclusively on connections.  In a world were people have 2000 facebook friends that is a viable way to get elected.  Some campaigns just draft people with large friend lists and have those people campaign instead of hitting the ground.  Relying on your circle of influence is just easier than actually campaigning.

Recognition is fun though.  I had thirty people wearing my face for the week of elections and most of them were engineers.  Because of this I was the only candidate with any presence on the south side of campus and got votes for that.  I, the independent, was the most recognizable candidate (it might have been the hat, actually it was assuredly the hat).  Where did that get me?  6th.

Basically, elections are fun and Ill have a cool model for something soon and then I can post it on the daviswiki too!  Happy to know I shored up the Asshole constituency though. Users/MaxwellKappes

20130320 17:21:58 nbsp I still say some of you are putting far too much emphasis on how you think something has drastically changed in ASUCD in past election or so. Everything you guys are bringing up has been done for years. Slates have always recruited popular candidates, even if those candidates didnt have much interest in ASUCD or actually agree with the slates viewpoint. Flyering, chalking, campaigning, etc. has never been as effective as just knowing a ton of people who will vote for you. That has always been the case and always will be the case. My point about those things was simply that if youre a candidate who is likely fighting for the 5th or 6th seat, it could potentially make up the difference in those close elections where 10s of votes decide who wins and who loses.

It also remains to be seen whether or not these claims about BEST basically eliminating the chances of Independents to win will hold true. All we have to go off of is one election in which BEST ran 5 candidates and elected 1 candidate who didnt meet the threshold. It would be interesting to see elections with three full slates for a few elections but I dont see it lasting longer than that. The nature of graduation turnover tends to limit slate lifespans. I would agree though that as long as there are three active slates recruiting, it would make sense that some potential Independent candidates would get pulled into one of the three slates and the remaining Independents may be weaker candidates. At the same time, if a really strong candidate with a large support base decided to run as an Independent, he or she could still win. Either way, Im curious to see what happens in next years elections. Users/JonathonLeathers

20130321 09:59:03 nbsp Interesting model, Brent.  Though I dont know if I agree that you necessarily need multiple bases to win.  I didnt have any real solid bases (besides PAD, which clocks in at under 50 people anyway), and I still managed to snatch a seat.

I think a candidate with experience in campaigns specific to the ASUCD microcosm can jump the hurdle and sneak in. Users/EliYani

20130322 20:43:35 nbsp Assumptions:
1) More slates > More Candidates > Higher turnout
2) In high turnout elections it is harder for independents to get elected because of the number of #2 votes required.
3) High turnout elections benefit slates because of the ordinal ballot system and #2 votes from one candidate (generally) going disproportionately to their slate above everyone else.

These are the assumptions that I make when I make the claim that this new environment may be more hostile towards independents.  That being said, ASUCD elections have been in a period of instability since GOs second election, where slates come and go quickly and there arent always multiple slates in an election.

Jonathan, Miles and I are making huge assumptions about the future of BEST (we are biased in its favor).
I think what it comes down to is campaigns are becoming more and more reliant on the internet and less on the ground game.  Yes, there are still ground campaigns, but the reward is so small in comparison.  For example: I saw a much smaller number of candidates canvassing this election compared to last.  Not as a percentage, but as a raw number.  Why do ground game when you can just facebook everyone?  The Varsity Facebook Team was for people with more than 500 friends bad in 2006, but now Im the senator with the least number at 560, and several have near or over 2000.


 Users/MaxwellKappes
