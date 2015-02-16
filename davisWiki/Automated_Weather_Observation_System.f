AWOS, or the Automated Weather Observation System is used by pilots to tell them them imporant variables about the weather such as: visibility, ceiling (cloud base), wind speed and direction, altimeter setting (i.e. atmospheric pressure), temperature, and humidity, and precipitation.

AWOS is a standard type of system used by the http://www.wrh.noaa.gov/sto National Weather Service, though this particular site is not linked to weather forecasting.  It is one of the best sources of realtime weather data on Campus.
  It may be of interest that a major supplier of AWOS systems is Allweather http://www.allweatherinc.com/aviation/awos_dom.html located in Natomas.  There are exDavisite engineers employed by Allweather and at least one Davis company supplies components for their systems. Users/GrumpyoldGeek

The Davis AWOS, based at the University Airport is operated by the Cal Aggie Flying Farmers, and can be accessed via phone (530)7546839, http://www.calaggieflyers.com/AWOS/sai.html website, http://usawosweb.com another website, or radio 119.025 MHz AM (part of the VHF Airband). It is an All Weather (formerly Qualimetrics) Model 900 AWOS in the AWOS III configuration. This means the following sensors are present:
  barometric pressure
  temperature and relative humidity
  wind speed and direction
  visibility
  cloud height
  precipitation accumulation (rain gauge)

 METAR and Technical Information 

METAR is a weather description format used over radio and internet by http or ftp. A good http client and parser for METAR is the metar project: http://www.leune.org/metar/. Although there are various nifty desktop applications that can pull this data and the National Weather Service does carry this feed, if you use it regularly, you will notice that there are odd gaps in the University Airport feed during which it doesnt update. It is not in the listings, so youll have to find a way to insert the code KEDU (formerly 0O5) into the software.  To read them manually (or just understand how they work), check out the http://www.wunderground.com/metarFAQ.asp Weather Underground METAR FAQ.

If all else fails, KSMF is a very reliable feed and has a good METAR feed (forecasts and alerts).  It is based at Sacramento International Airport, close enough for most weather information to be accurate for Davis as well.

  KEDU  University Airport  (http://aviationweather.gov/adds/metars/?station_idskedu&std_transstandard&chk_metarson&hoursStrmost+recent+only undecoded METAR)
  O41  WattsWoodland Airport
  KVCB  Nut Tree Airport, 134.75 MHz  (http://weather.noaa.gov/cgibin/mgetmetar.pl?ccccKVCB undecoded METAR)
  KSMF  Sacramento International Airport  (http://weather.noaa.gov/cgibin/mgetmetar.pl?ccccKSMF undecoded METAR)
  KSAC  Sacramento Executive Airport, 125.50 MHz  (http://weather.noaa.gov/cgibin/mgetmetar.pl?ccccKSAC undecoded METAR)

Other local stations are:

  DWA (formerly 2Q3)  Yolo County, 125.775 MHz
  FR10776  Medlock Field, Davis
  FR10782  Maine Prairie, Dixon
  FR10752  CHP Academy (off just east of West Sacramento)

There is a feed for Winters as well, but I dont have it in my notes.  Anybody know it?


The radio signal at 119.025 MHz is both AM and FM, but Users/EricKlein says it is hard to get on AM. He would know because he flies at the airport. So we should leave it saying both, or say nothing. Most of the websites for pilots seem not to say what type of modulation it uses and let the pilot figure it out for themself. Ill just leave it saying both until there is more discussion.
   Actually some aircraft only have VHFAM radios (No VHFFM), so its usually assumed that at least AM will be supported (for those frequency ranges)Users/JevanGray Jevan
    Indeed, my radio defaulted to AM on that frequency so that is why I put AM originally, but Users/EricKlein changed it to FM. I still think we should say both. Users/NickSchmalenberger
    Actually, its just the opposite.  All aeronautical voice in that band is AM.  It can be received on most FM receivers because of a fluke in the way the demodulation is done, but the volume will be very weak. Users/GrumpyoldGeek who BTW, holds multiple FCC licenses.

What is a feed? RSS? Maybe you get this stuff over the internet, but if it is for small planes, radio, not internet is probably its primary media, so we should explain about that if we are going to have all the other places. I thought it was fine just talking about the airport University Airport. If we are going to talk about the other airport weather stations we should explain a lot more about the FAA weather system, which Im not sure we want to.Users/NickSchmalenberger
  The specific reason I listed them here is because they are a pain in the ass to find online.  There is no easy give your location and here are the closest stations, and here are their update schedules and information carried.  Its compiled from a handful of text files located in various sites around the internet.  Weather information is very geeky and not a simple topic... and this is the relevant information for Davis.  I really really hate the idea that the Wiki can only list the popular trendy easy to use resources like RSS feeds.  METAR may not have a OSX screensaver for it, but it is valid information useful to Davis residents who want it.  When I see Here are some METAR feeds, I know exactly what it means.  If you say Here are some RSS feeds, youre going to confuse a good chunk of visitors.  Dont dumb down the Wiki.  Users/JabberWokky
  I think the extra info is good... also, if this page was really to only have information for the University Airport itd seem better suited to just be a section on that page, rather than being a whole separate page. Users/JevanGray Jevan

Is it just me, or does KSMF have an ASOS instead of an AWOS? Users/BrentLaabs
  Have you guys seen http://www.faa.gov/asos/map/CA.cfm this faa page before?  For one thing it shows that SMF has an ASOS. Users/JevanGray Jevan
  No idea, but it would be nice to list the equpment at each location.  I think last three I listed are operated by Forestry Service rather than NWS... it would be nifty to list the governing body for each as well.  It would also be good to list frequency info for the direct feed; I havent played with them since I was an active HAM operator years and years ago.  It took me awhile to compile this list; with the IDs, it should be easier to locate additional information (maybe even go out and get some pictures of the units!).  Users/JabberWokky
   The NWS provides some http://www.weather.gov/tg/siteloc.shtml basic info on METAR sites, but I dont think thats what youre looking for.  Im coming at it from the meteorological viewpoint.  http://atm.ucdavis.edu/weather/weather_station.php My departments weather station appears to be running in real time, once again.   CIMIS also operates its own http://wwwcimis.water.ca.gov/cimis/frontStationDetailInfo.do?stationId6 weather station, just north of my departments, but you can only get data once a day.  And they make you register for a frelling account.  Of course, these arent AWOS/ASOS at all.Users/BrentLaabs
     No, no... I was talking about information about the actual equipment  serial numbers, history of the installation, pictures of the setup, the name of the engineer in charge of it, etc.  It would interest... uhh... me.  I think.  Still, no stranger than listing all the manhole covers or payphones.  Ive poked at a couple stations and always found them nifty.   Users/JabberWokky
      I think this is a great idea. I also agree that we should list the frequencies for the others because that is their primary media, being for pilots after all. I have already done so for the ones I could find. What is the application layer protocol for these feeds? We need to explain that if people are ever going to know how to receive them. Also, since I assume they are text only, I dont see why a desktop application is necessary. Maybe you could mention one GUI and one console application for these feeds when you say the protocol. Users/NickSchmalenberger
      I also agree with you, Users/JabberWokky, about RSS. If it is so simple, why do they bother with Really? Superlatives only complicate. Anyway, RSS was just the only thing I could think of that is called a feed, and all I wanted to know was the application protocol. Is there an RFC? Thanks. Users/NickSchmalenberger
        METAR is a well defined protocol, if thats what you mean.  It predates XML, so its a simple block of text.  A Google search pulls up a few good protocol descriptions and most text processing languages (perl, python, php, etc) have standardized libraries to parse it.  METAR is a syndication protocol  the actual data can be read directly off the units (pilots do this when landing) using a VHF decoder, as they broadcast their data.  Different units have slightly different protocols  there have been three or four different standards over the years.  Do a couple searches or ask a pilot or meterologist... the information is very open and available.  Nifty, too, if youre into stuff like this.   Users/JabberWokky
        I added some description of the protocol and a link to a client. In the case of radio, what is the modulation and encoding? Users/NickSchmalenberger P.S. If I used the word feed in this sense I would feel like livestock.

