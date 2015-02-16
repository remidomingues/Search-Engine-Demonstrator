We currently have just one server  a 1U rackmount machine with a 2.0GHz Athlon64 dual core processor (x2 3200+), 4GB of ECC memory and 200GB of RAID1 storage. The server is based on a Tyan Transport barebone package and runs Gentoo Linux.

We are hosted in Cernio Technology Cooperative Cernios cabinet at United Layers facility in the 200 Paul data center in San Francisco.  We recently moved the server from Cernios halfcab at Sonic.nets facility in Santa Rosa to take advantage of better pricing, connectivity, and logistics.

Our colocation expenses are approximately USD$70/mo.

There are several other Wikis hosted on the system, including http://scwiki.org/ Santa Cruz Wiki, http://anthill.org/ The Ant Hill Housing Cooperative, and http://projectsycamore.org/ Project Sycamore, but DavisWiki is by far the largest.

Below is the discussion that took place when we were debating whether and how to purchase and colocate our own server equipment.


 Buying a server 

 Colocation 

 Background and Definitions 

In this context, colocation (see wiki:WikiPedia:Colocation ), or colo for short, means renting physical space, an Internet connection, electrical power, and physical security in a central facility whose amenities and capabilities far surpass anything an individual or small company could build on their own.

Rack space is measured in Rack Units (abbreviated U) equaling 1.75 inches in height. Width is 19 inches. see http://www.sizes.com/units/rack_unit.htm

Power consumption is usually derived from current, measured in amps, as measured at any given point of time, rather than Kilowatthours used over the course of a month as youd see on a utility bill.  Its assumed that all equipment in a colo facility is always on  fluctuations are usually relatively minor and vary with disk and CPU use.

Network use is usually billed perGBtransferredpermonth on lowerend contracts, and using the 95th percentile measurement on higherend contracts.  With the 95th percentile measurement, transfer rates are measured every 5 minutes over the course of a month.  The highest 5% of the usage is ignored, and the bill is based on the average usage for the remaining 95% of the time.

 Available to DavisWiki.org 

Users/GrahamFreeman Graham Freeman of Cernio Cernio has a halfcabinet (21U) at the enterpriseclass http://sonic.net/sales/colo/ Sonic.net datacenter in Santa Rosa.  Cernio has offered to make up to 4U of space, 2 Amps (ongoing, spotchecked every once in a while), 2 public static IP addresses, 512Kbps@95%, and physical access available to the DavisWiki.org project on a cooperative basis.  This means that DavisWiki would pay for what it uses based on the actual cost of these resources  Cernio will not attempt to make money off of the deal.  Cernio would benefit by having increased purchasing power and by working closely with goodnatured, communityminded, competent, and technically skilled people.

Users/LukeCrawford of http://prgmr.com/  has a full rack (2 post) in the community cage at herakles data (Its down by Frys)  and a 100 megabit commit.   You are welcome to drop a 1u server in, or if you dont mind NetBSD, I can give you a NetBSD/xen server with 2G ram and a 10G  slice of my raid 1+0 fibre channel disk without charging you.   You are welcome to use this setup for a primary or a backup.    Serial consoles and remote rebooters will be provided either way.

 Notes on colocation 

Space:  Rackmounted hardware only.  (No desktops, nor towers.)  Rack rails arent necessary, but they help.  A cable management arm may not fit if its on a long server.

Power:  2A is mostly a guideline to make sure we dont get carried away with unnecessarily power consumptive equipment.  More is available, but probably wont be necessary.

IP addresses: Well probably only need one public static IP address, but more are available if theyre used wisely.

Bandwidth consumption:  512Kbps@95% means that most of the time (24h/7d), the site is transferring data to/from clients at a cumulative rate of 512Kbps.  DavisWiki and RocWiki combined are not likely to use even half that any time soon.  Even so, bandwidth consumption (and its associated cost) is the most significant variable.

Physical access:  Granting physical access to Cernios cabinet space means granting physical access to Cernios equipment as well as to the DavisWiki equipment.  It requires an wiki:WikiPedia:Rfid RFIDembedded picture ID, wiki:WikiPedia:Biometric biometric (hand print, body shape, total weight) verification, and a key.  Physical access will not be granted casually.  Users/PhilipNeustrom Philip Neustrom and Users/AmitVainsencher Amit Vainsencher have passed the initial screening.

 Commentary/discussion on colocation 
I dont think 2 Amps is enough to run a server. 2amps x 125volts  250 watts.  Users/ArlenAbraham arlen
   Im surprised that would even be mentioned but, assuming that is typical and not peak, that should be fine. Even though power supplies are rated 300450 watts (or more) for desktops, 1Us often have 250 watt ratings. The actual draw is considerably less, even for desktops. BTW, an amp is a unit of current, a watt is a unit of power, and a kilowatthour is a unit of energy. Oh, and North American line voltage is standardized at 120VAC. Users/SteveDavison
    It depends mostly on how many hard drives you have, how fast they spin, and how busy they are.  Some CPUs are very powerconsumptive as well.  I only use 3A right now for three servers, two switches, a firewall, and a PDU.  Besides, if 2A isnt enough, more is available  I just want to make sure its used wisely so that we dont deploy a power hog when its not necessary to do so. Users/GrahamFreeman


Why in the world is colocation even being talked about? How big IS this site?! Users/DomenicSantangelo
  We are running off of a dedicated machine right now, and its in a data center.  It would be no different, except that we would own the server and have physical access to it (and be able to upgrade it). We were in a shared hosting environment a year ago but ate up too much RAM and CPU for that to work (and we also need root to install software, etc).  Were not talking about owning a rack  just putting a single machine in someone elses space and paying for the space/bandwidth.  It would actually be cheaper than the $100/month we pay now, in all likelihood.  If youre wondering about traffic figures, I can provide those (last I checked it was ~6000 unique hits/day, ~2GB/day transfer) but keep in mind that serving up dynamic content is much harder than static content.

  Colocation is not that big of a deal, really.

     Yeah, I mean, I work for a webhosting firm so I have an idea of whats involved... I just didnt realize the wiki was so large in size. 2GB/transfer isnt that big, but the RAM and CPU figures would be interesting to see. Users/DomenicSantangelo

  I think the main thing is to plan ahead on all fronts, which we started doing from the beginning, and which Philip continues especially on the programming side, so this seems like a very opportune time to upgrade our hosting.  Plus it would just feel better to have the server in Santa Rosa rather than in New York or wherever it is now. Users/MikeIvanov
     Well, making decisions based on feeling definately seems like the logical thing to do. Joking aside, why not host somewhere in Davis? If youre going to colocate, ISPs usually offer that, too (my webhosting firms server farm is in San Diego, else Id be plugging them)... Itd be kind of cool to make it a fully Davis operation, wouldnt it? Plus, no driving to Santa Rosa if things go south! Users/DomenicSantangelo
      By feeling I really meant ownership and peace of mind rather than warm and fuzzy.  I guess those can be pretty close, though.  But my understanding is the hosts in town dont offer a reasonable solution for us.  It would be great to be hosted in Davis, just doesnt seem to be in the cards for now.  The Santa Rosa offer is to share a cabinet with a company already paying for the whole thing, which really reduces the cost of our share. Users/MikeIvanov
        Omsoft is the only place you can throw a server in Davis, and they are somewhat pricey.  Sacramento colo seems to be on the shady end of things, too.  I wish we could be in Davis, too, but Santa Rosa beats New York.

 Initial Recommendations for a System 
 Case/PSU/Motherboard 
  http://www.tyan.com/products/html/gt20b2865_spec.html Tyan Transport GT20 B2865 (1U)  Estimated cost: $650   Users/AmitVainsencher AV
   Right now, we dont need a ton of processor power, but the option to add more would be nice. I think a dual processor Xeon or Opteron motherboard like http://www.newegg.com/Product/Product.asp?ItemN82E16813131560 this one ($300) with a single CPU (for now) would be a good bet. Also, $650 is a bit steep.  Users/ArlenAbraham arlen
   Doesnt seem that steep to me since the $650 gets you a PSU, case, and motherboard. Further, the case can hold up to 4 SATA drives, which would allow us the possibility of a RAID5 setup.  Users/AmitVainsencher AV
   Another note: the motherboard used in this package is basically the same as what Sun uses for their AMD64 workstations and lowend servers. Industry backing is a plus, and Tyan is historically a rather good server solutions manufacturer.  Users/AmitVainsencher AV
   Seconded.  Most of my to order servers are Tyan.  Excellent motherboards.  Users/JabberWokky jw

 Processor 
  Athlon64 dual core 3800  Estimated cost: $300  Users/AmitVainsencher AV
   I think this is more expensive than its worth. Wed probably be better off with Xeons or Opterons.  Users/ArlenAbraham arlen
   Opterons are significantly more expensive than Athlon64s. Beyond that, I guess choosing between AMD and Intel is a preference thing. Personally, I like AMD more since Ive had good experiences with their processors. Also this processor gives us two cores, saving money that might go to a dual CPU motherboard.  Users/AmitVainsencher AV

 Memory 
  Two 1GB PC3200 ECC DIMMs  Estimated cost: $250  Users/AmitVainsencher AV
   This particular server needs a lot of memory, probably 4 gigs. If we get a  motherboard with four slots and want to upgrade ram, youre going to need 2x2gb sticks, which are expensive.  Users/ArlenAbraham  Arlen
   If you see the motherboard spec, it maxes out at 4GB.

 Storage 
  Two 74GB Western Digital Raptor hard drives (10K RPM, Serial ATA)  Estimated cost: $300 (These would be configured in a RAID1 for data redundancy)  Users/AmitVainsencher AV
   Raptors are nice, but expensive for the amount of storage they provide. On the plus side, they have five year warranties. Also, if youre limited by the number of drive bays (most 1U cases have three bays), you max out quickly. SATA is definitely the way to go (faster than IDE, cheaper than SCSI). Rather than raptors, I think that we should get a few intermediately sized drives, like 250GB, and put them in RAID 5. A hot spare would be nice, but no one is going to lose money if the wiki goes down for a few hours while we rebuild the RAID.  Users/ArlenAbraham arlen
   We are currently using a total of 13GB on our machine, including the OS, etc.  74GB would certainly be enough space, but it might get in the way of: 1) Allowing for new things that would potentially take up more space, such as uploads of any size 2) Hosting more local wikis on our machine to bring our bottom line down.  Also, we would almost certainly eventually fill up the 74GB, but it would take a while if all factors were kept the same as they are now.
   Personally, I dont trust the larger consumer grade drives with high activity and  the burden of being constantly on. In my experience, such drives dont last very long in server situations. However, we definitely need to find a middle ground between price, size, and reliability... when I made my initial post I was under the impression that the server would never need more than 74GB.   Users/AmitVainsencher AV

 Case 
  Needs 1U or 2U. Redundant power supplies would be an additional ~$200. Any suggestions?

 RAID Controller 
  If we want to do anything fancy like RAID 5 or matrix RAID, well need a SATA RAID controller. I dont know much about these.  Users/ArlenAbraham arlen

Price estimates were found through http://www.pricewatch.com/ Pricewatch. This configuration would cost roughly $1600. Users/AmitVainsencher AV

Are you considering purchasing a built server?  It may be cheaper and will save the trouble of configuring the hardware.  The hard part, of course, is finding something that fits what we need, but it shouldnt be all that hard.  For example, http://www.visionman.com/RackmountServer/VCPRE1USUP.htm this setup is pretty close, but I dont know anything about this company.  In a couple of weeks I should be able to help out with some funds.  Should we set a deadline for a week before New Years or so to have a built server? Users/MikeIvanov

Id strongly recommend buying a preconfigured server rather than building your own.  If you throw in all the extra shipping charges and, most of all, time spent hunting down the best prices and dealing with inevitable vendor SNAFUs, youre going to spend a lot more resources building your own than you would buying something from a server vendor.  PN mentioned that http://www.siliconmechanics.com/ is strongly recommended by the LiveJournal folks, and Ive been reasonably happy with Dell.  Users/GrahamFreeman

I wouldnt have a problem doing the hunting, configuring, assembling. Also at least with the inital setup I suggested, everything comes from one vendor except for standard parts such as the CPU, RAM, and hard drives.  Users/AmitVainsencher AV
  This is an offer we cannot afford to pass up no matter which route we decide to go.  I have every confidence in Amits skills, even from one brief interaction with him online. Users/MikeIvanov

 Purchased items and status 
The following items were purchased on 20051226: (4) STT D400 1G/64X8 ECC Memory, (1)Tyan Transport GT20 B2865G20S4H SATA 1U Server Platform, (1) Chenbro 24 Mounting Rail Set for RM124, (2) Maxtor 7Y250M0 250GB Serial ATA 7200rpm 8MB cache Hard Drive, (1) AMD Athlon 64 X2 DualCore Processor 3800+ (2.0GHz) Retail.

After a courageous fight against hardware demons, Amit found the hardware defective.  On 20050215 the barebones components were shipped back to the manufacturer for replacement/fixing.  After a motherboard replacement, the problem is still appearing.  A hard drive was purchased to test possible issues with Maxor drives, but it turned out that there were no issues with the hard drive.  2 DIMMs (certified) were ordered on 200639 and solve the problem, and more ordered on 2006328 after we figured out they actually work.

The old memory needs to be sold to recover costs.  As such, were selling (4) http://www.supertalent.com/SuperTalentMemory/products/product_detail.php?PND32EB1GW STT D400 1G 64X8 ECC DIMMs (memory). They work fine, just not with nforce4 chipsets which is why we have to sell them. $70 a piece or better offer. Weve managed to sell two of these sticks, but two more are still up for grabs. Theyve been verified working on various P4 motherboards (by the manufacturer), on an Athlon64 Socket 754 (with a VIA chipset), and a Dual Athlon MP system (both by us).

The new system was installed in Cernios cabinet at Sonic.net on the evening of April 5th (picture below!). Its been completely stable since the installation of the new memory, and were in the process of moving data over to it for the site transition. Thanks for all the help, Graham!

 Raising funds 
Okay, so buying a server is obviously going to cost some dough.  How are we going to get said moolah?

A: Donate DONATE!!!

  I can afford to throw in about $400 out of pocket, currently.  I may likely be able to contribute more after Christmas due to gifts as well as a job (but Im not positive I will be getting said job). Users/PhilipNeustrom
  I could put down about $150  Users/AmitVainsencher AV
  My contribution is really kind of a wild card, but unless things go terribly wrong in the next two weeks, I can definitely match Philips ($400 at least).  I really think we should set some target sums/dates. Users/MikeIvanov
  wiki:RocWiki:Front_Page RocWiki: Robert Polyn donated $100, Rudy Bang donated $100

How about, as suggested, we go with Dec. 27th as the deadline to have the stuff purchased  thus giving us time over Winter Break to get configuration done.  We will have $~1050 in personal contributions, but having more than that would give us much more leverage.  We should set a deadline for collecting funds for Dec. 19th, giving about a week for the parts to ship.  Any ideas for fundraising? Users/PhilipNeustrom

  Just to be clear, are there additional costs involved in maintaining the wiki till 07, or is this it? I recommend teaming up with MSN and having lots of pop up ads. Just kidding. I recommend having some kind of a please donate for the holidays kind of message on the front page. I think a lot of people would be willing to donate over the next year, and a little goading to have them do it now instead wouldnt hurt. Alternatively, we can contact one of those shirt making places, and sell Wiki Shirts at 100% markup. Users/CraigBrozinsky

    We will still have to pay for the hosting costs, as we do now.  This is an extra cost because we need to purchase hardware, which is unfortunate, but it happens.  I am thinking of getting a bunch of shirts made and selling them for donations, but Im not sure I will have time to do this (if anyone else does, do it!).  Last year we raised a total of $1000  which entirely offset the hosting costs.  Im confident we can keep doing that.  Users/PhilipNeustrom

     The sale of Wiki Shirts is underway.  Users/GrahamFreeman

     Emailed Samplistic Records Samplistic Records about a proposal to sell Samplistic CDs on behalf of DavisWiki  initial response is favourable, but this isnt yet working out as well as the Wiki Shirts.  Users/GrahamFreeman

 Awesome photos of the machine in the data center 
