

OpenStreetMap is a workinprogress mapping website / interface that aims to produce an entirely free (as in speech) set of maps of the world  thus they can be used on our wiki without having insurmountable copyrights issues that might be the case with other sources.  The maps are contributed by regular people.  Unlike things like http://maps.google.com Google Maps, OpenStreetMaps are freely usable by anyone for any purpose.  All the software that powers the site is freely licensed as well.  For these reasons, its been considered a potential option for wiki mapping at some point in the future (wiki:wikispot:Mapping Discussion read more here if youre interested).

The http://www.openstreetmap.org/?lat38.5449&lon121.7405&zoom13&layersB000FTF Davis map coverage seems pretty good, but as always, it is good to check: is your neighbourhood accurate? If not, you should fix it.

 June 22^nd^ 2008 Mapping Party 


The mapping party was a success in that mappers showed up, braved the heat and made many edits to the http://www.openstreetmap.org/?lat38.5494&lon121.7396&zoom13&layersB00FT map.

Who did What?
  SteveC added all of the pathways for the Arboretum and many other bike paths were improved upon.  http://www.openstreetmap.org/user/SteveC/traces/131352 GPS trace
  Users/AlexMandel traced North UCD Campus  http://www.openstreetmap.org/user/wildintellect/traces/132101 GPS trace
  Users/BillKendrick added some missing greenbelt bikepaths, streets and footpaths in south east Davis (http://www.openstreetmap.org/?lat38.54462&lon121.7073&zoom15&layersB00FT around here)  http://www.openstreetmap.org/user/Bill%20Kendrick/traces/132204 GPS trace

Links
  http://wiki.openstreetmap.org/index.php/Davis the official openstreetmap wiki entry about the event
  http://www.facebook.com/album.php?aid41541&lb8abe&id518895777 More photos of the June 2008 mappers at Delta of Venus (by Users/BillKendrick)

 Making a map for your Garmin GPS 

After installing http://wiki.openstreetmap.org/index.php/Mkgmap mkgmap you can use the following commands to create a file than can be loaded into any Garmin GPS with a model name ending in x.

{{{curl g http://osmxapi.hypercube.telascience.org/api/0.5/bbox121.82,38.49,121.67,38.59 o data.osm
java Xmx512M jar mkgmap.jar n GMAPSUPP data.osm}}}

Mkgmap will also allow you to combine several .osm files into one large .img file. The file that results from these commands just covers the immediate Davis area. It will have a level of detail similar to http://www.openstreetmap.org/?lat38.5485&lon121.7392&zoom13&layers0B0FTF this; but you can edit and improve the map.

 Premade Maps for Garmin GPS 
Alternatively you can download premade maps.  All use OSM data and are updated regularly.  Compatibility and stability on devices may vary.  See Maps for additional map resources.

  http://downloads.cloudmade.com/north_america/united_states/california cloudmade.com has weekly generated maps for the entire state of California
  http://garmin.na1400.info/routable.php Lambertus has worldwide coverage and routable maps with various map installers (PC and Mac)


20080619 21:49:01 nbsp Anyone else interested in taking the wiki spirit and applying it to the area covered by DavisWiki? Users/JasonAller
