IP addresses are the “phone numbers” for computers connected to networks. There are private IP addresses  which are like internal phone extensions  and external or public IP addresses, which are like regular phone numbers.  This is a list of local IP ranges and particular addresses of interest. The Davis Wiki logs and publicly displays the IP addresses of all users. This helps track vandalism and fake accounts. If you wish to remain Wiki Anonymity anonymous, you should not use your Importance of using your RealName RealName and log in from a Public internet terminals public internet terminal (see the Privacy section below for more information.)

A full, indepth technical explanation of IP Addresses can be found wiki:wikipedia:IP Address at Wikipedia.

You can http://daviswiki.org/FAQ#head329600ac3a35a9a53c62affaa26c5d9c817e50dd hover over any username in Recent Changes to display the poster’s IP address in the {{{title}}} tooltip.

The List

Compiled (mostly) in wiki:wikipedia:Classless InterDomain Routing format.

  24.10.34.0/24  Comcast Comcast Cable
  24.7.158.0/23  Comcast Cable Communications
  63.204.72.0/24  AT&T SBC Internet Services
  64.30.119.0/24  SureWest Communications
  64.160.0.0/12  AT&T SBC Internet Services
  64.165.72.144/29  Mishkas
  66.81.0.0  O1 Dialup Services
  67.182.163.0/24  Comcast Comcast Cable
  67.182.174.0/24  Comcast Comcast Cable
  69.12.224.0/24  http://sonic.net/ Sonic.net
  69.236.108.0/24  AT&T SBC Yahoo DSL (in Vacaville)
  71.128.0.0/11  AT&T SBC Internet Services
  128.120.0.0/16  UC Davis
    128.120.57.120  MOObilenet in the Coffee House
     (not sure about the size of the subnet)  Users/ArlenAbraham
    128.120.179.0/24  Solano Park on UC Davis Campus
    128.120.169.1  Segundo/Regans Rienda Hall on the UC Davis campus
  http://ws.arin.net/whois/?queryinput168.150.0.0 168.150.0.0/16  DCN Davis Community Network, also used by Omsoft
    168.150.193.x  Previously used by DCN servers
    168.150.194.0/24  City of Davis
    168.150.253.0/24 Some DCN and Omsoft servers
      168.150.253.1 http://wheel.dcn.davis.ca.us/ Main DCN server. Does http, smtp, pop, ftp, and shell(ssh and telnet). It is also the secondary DNS server. The ssh service is sort of old, OpenSSH_2.9p2, and doesnt accept public key authentication or sftp. Applications available include screen, lynx, ircII, tin, and gcc.
      168.150.253.2 spoke.dcn.davis.ca.us Primary name server.
      168.150.253.7 velocipede.dcn.davis.ca.us, crank.dcn.davis.ca.us, http://events.dcn.org/, http://www2.dcn.org/ Mailman lists, Zope server for community calendar project, other webserver
      168.150.253.55 http://asoka.omsoft.com/ One of Omsofts squid proxies. Most http access from dcn/omsoft users to web servers on the other side of this appears to be coming from here. Shell users on wheel are excepted.
      168.150.253.56 http://bala.omsoft.com/ Omsofts other squid proxy. Used occasionally.
    168.150.240.0/24 Omsoft gives static IPs for DSL out of this subnet.
    168.150.241.0/24 This one too.
  169.237.0.0/16   UC Davis
    169.237.5.0/24  Computer Science computer science department undergraduate labs (CSIF)
    169.237.6.0/24  computer science department servers and faculty workstations
    169.237.7.0/24  computer science department graduate research lab workstations
    169.237.32.0/24  Electrical and Computer Engineering department
    169.237.35.  LAWR computer lab in Hoagland Hall Hoagland 124
    169.237.38.0/23  Chemistry department
    169.237.76.0/24  Shields Library Periodicals Section
    169.237.122.0/24  Anthropology grad student computer lab in Young Hall
    169.237.157.111 Western Center for Agricultural Health and Safety/Center for Health in the Environment
  10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16  These are internal IP addresses and arent visible on the internet.  They usually mean you are behind a firewall or router. See http://www.ietf.org/rfc/rfc1918.txt RFC1918.
  127.0.0.0/8  your layer 3 loopback network. Whatever computer youre on, you can contact yourself at any IP in this range. Honest. wiki:WikiPedia:Loopback Wikipedia article. Of course, some OSs are lame and dont implement this correctly and only 127.0.0.1 works as a loopback.

Most WiFi hotspots are on SBC DSL lines, the TMobile hotspots are the only ones in Davis with static IPs.   Then what are they?

An easy way to determine your IP address over the web to add an entry is to go to http://www.whatismyip.com/.

Using the List

   TODO: How to compare the above to Recent Changes
   IM software generally does not allow you to see peoples IP addresses, however establishing a direct connection to another IM user (to send an image or voice chat) may allow you to see their IP.  You can do this by running netstat from a command prompt before and after establishing the direct connection, then manually comparing the output. (this works on any OS that has a command line interface)
   Some people just like making lists as a curiosity, similar to spotting trains.

Privacy
Contrary to public belief, publicly posting your IP address carries no more security vulnerability than having your phone number listed in a telephone directory. (In todays securityparanoid world, the phone book could never be created.  And with the increasing popularity of mobile phones and VOIP, the phone book as we know it is on its way out.) IP addresses have been the subject of Wiki Anonymity debate on the wiki because their public display could theoretically afford any malicious script kiddies that use the Wiki the opportunity to attack your computer. On the other hand, they provide yet another interesting bit of Davis trivia.

Its generally impossible to determine the location of a given user with any degree of certainty or granularity.  For example, someone who lives in Davis may have home DSL on a dynamic IP plan with Sonic.net, which means that they may get an IP address this week that was used by someone in Eureka last week, and will be used by someone in Los Angeles next week.  Services from the big megacorps (e.g. ATT, Comcast) give more geographically accurate info in reverse DNS, but even then its not very close to home  e.g. someone in Davis may show up as being in Sacramento, except when they show up as being in Los Angeles (as they sometimes do.)

Also, many ISPs outsource critical components of their dialup modem service to a company based in San Jose, and due to the way their network is set up anyone using such a dialup service anywhere in the state may appear to be in San Jose.

If youd like to experiment, http://www.hostip.info/ www.HostIP.info is a free IP address geolocation service.  Another relevant source of info is the http://en.wikipedia.org/wiki/Whois WHOIS records with http://en.wikipedia.org/wiki/Regional_Internet_Registry RIRs such as http://en.wikipedia.org/wiki/American_Registry_for_Internet_Numbers ARIN.  This page: http://www.dnsstuff.com/tools/myipaddress.ch  will show you both geolocation info and WHOIS records for what it perceives to be your IP address.


Some time in 200701  Using HostIP.info, my current IP address shows as close to home (Oakland) as one can reasonably expect  it says that Im in San Francisco.  Thats not true, of course, but its closer than, say, San Jose or Los Angeles.   My mother sent me an email this morning from Eureka, California, so I looked up her IP address on the same hostip.info service  it says that IP address is in Avondale Estates, Georgia.  Earlier this afternoon, a friend posted an update to a wiki that logs which IP address each contributor was using at the time.  I know this person was in Davis, California when he posted his update and that he wasnt using any VPNs or proxies, and yet his IP address shows up as being in Springfield, Ohio.

This isnt even considering the folks who use such tools as a VPN or proxy server.  When I was in China, I used a VPN connection back to the USA, with the endresult that my web browsing appeared to originate from Santa Rosa, California even though I was in Jiangjiajie, Hunan Province.  Users/GrahamFreeman Graham Freeman

20070227 19:00:51  ARIN WHOIS is not always the more reliable, it plots SteveO.s Ip to Sacramento C.C., and occasionally mine to Texas. Just noting, ~DavePoole

20070228 20:45:43 nbsp Dave, (1) theres no other RIR besides ARIN that would serve IP blocks in North America, and (2) its a matter of how things are deployed, not of reliability.  e.g. the IP address http://www.opendns.com/ 208.67.222.222 shows up as being in San Francisco, even though equipment that answers on that IP is also deployed in Palo Alto, Washington DC, Seattle, New York City, and London.  Users/GrahamFreeman

20070228 07:43:15 nbsp If only we get get IPv6 leases here. Users/WesHardaker
 I asked Omsoft about it a few years ago and they said they had no plans. Hurricane Electric says they will give you a T1 or something, but I cant afford that of course. Currently I use Freenet6 for a tunnelbroker because they give me a /48 and allow irc. I have also used Hurricane Electric because they are much better connected to this area, being in the Bay Area, but they only give a /64 and dont allow irc. Have you used any others? What are your experiences?  Users/NickSchmalenberger

  I actually do use HE and have been fairly happy with them as a v6 provider.  I asked Omsoft about it a while back too, and at the time they had less plans ;).  Itd be nice to get something real rather than the /64 that HE gives me.  Which is fine, really, for me but its harder if you dont bridge your internal wireless and wired networks (I do). I didnt actually know about the irc restriction (though that explains why I never am connected to IRC via ipv6 when I thought some of the servers supported it)  Users/WesHardaker

  My coworker pointed me to: http://www.sixxs.net/ which seems to provide /48s as well. Users/WesHardaker
