 UC Davis 
  http://128.120.248.18/~codar/ or http://www.bml.ucdavis.edu/facility/webcam.html  BOON (Bodega Ocean Observing Node) at Bodega Marine Laboratory view of Horseshoe Cove.
  http://169.237.55.240/Jview.htm or http://www.ae.ucdavis.edu/webcams/GiedtCam.htm  Giedt Hall looking North.
  http://169.237.60.191/view/index.shtml   Tercero 2
  http://169.237.73.13/view/index.shtml or http://www.ae.ucdavis.edu/webcams/BreweryWineryFood.htm or http://wineserver.ucdavis.edu/content.php?categoryFacilities&id857  Construction of The August A. Busch III Brewing and Food Science Laboratory
  http://169.237.137.85/view/index.shtml  or http://www.ae.ucdavis.edu/webcams/HWCCam.htm  Student Health and Wellness Center
  http://169.237.137.95/view/index.shtml or http://www.ae.ucdavis.edu/webcams/RMICam.htm   temporarily down?
  http://169.237.137.101/view/index.shtml  Camera at http://maps.google.com/maps?q38.53503%2C121.750854 38.53503,121.750854 bearing 230 deg. (On water tower adjacent Earth and Physical Sciences building). Views intersection at Garrod Drive & California Avenue. Cottonwood Cottage is on the corner.
  http://169.237.137.108/view/index.shtml   King Hall renovations (camera on Mrak Hall roof?)
  http://169.237.137.110/view/index.shtml or http://www.gsm.ucdavis.edu/webcam/  View of the Gallagher Hall Graduate School of Management Offices & Conference Center
  http://169.237.137.112/view/index.shtml  View of the Student Community Center

 Davis 
  http://yoloberryyogurt.com/yogurtcam.html  Yolo Berry Yogurt used to have an instore webcam. However, they got rid of it due to the complaints from some customers.

 Temporary/elsewhere 
  http://www.yoloelections.org/returns/webcam.html  Yolo County Election Returns webcam. Watch live as your vote is (mis)counted. This link may return during election season.
  http://119.111.124.194/phcam.html  SpammerCam: watch spammers in action as they Users/angelmurrei deface http://119.111.124.194/cookies websites around the world!

 You can control webcams marked with an asterisk.

Also see Surveillance Cameras. Not nearly as fun (really, youre on the other side of the lens).

Quickndirty webcam finder. If you dont understand it, its not for you.
{{{
#!/usr/bin/env python
#tcpclient.py: Quickanddirty webcam finder (with bugs, shortcomings). Hacker friendly.
#To run: python u tcpclient.py from a shell.

import socket

def getdata(HOST):
  stringgethost(HOST,/)
  if URL/view/index.shtml in string:
    stringgethost(HOST,/view/index.shtml)
  return string

def gethost(HOST,GET):

  sock  socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  sock.settimeout(1)
  sock.connect((HOST,80))

  sock.send(GET %s HTTP/1.1\r\n%GET)
  sock.send(Host: %s\r\n\r\n%HOST)

  string  
  data  sock.recv(1024)
  while len(data):
    string + data
    data  sock.recv(1024)
  sock.close()
  return string

a169
b237
for c in range(0,255+1):
  for d in range(0,255+1):
    HOST%s.%s.%s.%s%(a,b,c,d)
    print Trying %s...%HOST,
    try:
      stringgetdata(HOST)
    except:
      print error\r,
    else:
      if Camera in string:
        print \aCamera found
}}}
