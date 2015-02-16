

This page is a guide on how to spread knowledge via modern media in a sustainable education model.
The original seed of information derives from work done by a student Action Research Team as part of Education for Sustainable Living Program lecture series organized by California Student Sustainability Coalition at UC Davis in 2007. While this page started as a class project, please feel free to add any additional information you may know that would benefit other trying to use this guide.


Goals:
 1. To promote the open exchange and transmission of ideas by recording each of the lectures in video and audio for the quarter and putting them online for the public’s use.
 2. To create a manual for future classes/organizations to use as a guide for media casting.

The instructions below reflect what the team learned in the process of producing weekly video and audio files of each lecture with a final DVD of all the lectures at the end of the season. Right now were still trying to find a permanent web host to keep the files and toying with alternative distribution methods.

Why not call it Podcast: Basically Apple is currently trying exert a claim over anything with the word pod in it and we want to avoid that whole mess. Its really a poor word anyways since an iPod is not required in order to view any of the files produced through these methods.

 Sustainability in Education
 Knowledge is a resource to be shared for the continual maintenance and improvement of society. Everyone should have equal access to the same body of human knowledge to with it what they want. Just because some people pay (college students) to fund the improvement of knowledge doesnt mean that others should be deprived of these advancements, especially when it comes to public education institutions who exist for the betterment of society. (Oddly private universities are leading the charge on making knowledge an open resource)
   The Center for Open Sustainable Learning http://cosl.usu.edu/about
   MITs OpenCourseWare http://ocw.mit.edu/index.html
   OpenCourseWare Consortium http://www.ocwconsortium.org/

 Sustainability in Technology
 By creating and perpetuating software that is open to all for use however they choose, we ensure that future users of the software will have the same opportunities and tools available to them. Through participation in the community based model of software development we encourage and foster rapid innovation that leads to useful tools for everyone. (who has access to a computer, which is a different social issue)
   Free Software Foundation http://www.fsf.org/
   Open Source Initiative http://www.opensource.org/

 Tool List
  A Video Camera
  A Computer with a decent CPU and lots of hard disk space ( 24GB per 2 hours of video) plus extra room for converting formats.
  DVD Burner or Fast Internet Connection depending on how you plan to distribute the files.
  Software to (You can get all of these for free like we did, just keep reading):
   Capture Video
   Convert Video
   Make title screens and Menus

Licensing
 Why
 Before being able to record each lecture, we needed to choose a licensing format to protect the lectures so that they would remain available to the public, as well as to protect the rights of the lecturers.

 Software
 We attempted to use nothing but Free Open Source software most commonly licensed under a http://en.wikipedia.org/wiki/GPL General Public License in order to ensure that anyone in the world could repeat our steps

 Content
 We chose to use Creative Commons (http://www.creativecommons.org), a nonprofit licensing group that offered multiple varied licenses to protect works. Among these, we chose to use the Creative Commons License called the “Creative Commons AttributionNonCommercialShareAlike 2.0 Unported License”, which has since been updated to the 3.0 version, and can be found at (http://creativecommons.org/licenses/byncsa/3.0/). By using this specific license, it is acceptable to “copy, distribute, and transmit the work”, and to “adapt the work”, under three conditions. The first condition, “Attribution”, states that you first attribute the work in the manner that the author or licensor. The second condition, “Noncommercial”, states the work cannot be used for profit, and the third condition, “Sharealike” states “If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.” There are multiple other options available to potentially use, but this license gives the most freedoms to work with the podcasts, both for us and for other viewers.

After choosing the license, we had to get each of the lecturers to agree to the license conditions. We sent out emails to each of the lecturers in advance to inform them of our intentions and give them time to think it through or search of a feasible alternative that they might prefer.
Filming
 Camera
  Generally a video camera that uses miniDV is the most common format. Alternately there are camcorders out there that record to VHS, super8, minidisc or hard drives. Minidv and other digital format camcorders typically have an i1394 port(mini) aka Firewire. Depending on your computer youll need either a mini(4pin) to mini(4pin) (usually laptops) or a mini to 6pin(Desktop)
Links to examples...
In the case of miniDV we found that 80min tapes set to record on EP(Extended Play or LP Long Play) will record 120minutes at good enough quality for computer playback.
 Accessories
   Tripod : use a tripod your video will come out much better
   Power Adapter or Battery :  Dont forget to plan to power your camera, if your batteries are more than 3 years old think about getting a new one. Always have a backup plan(ie extension cord, spare, etc)
 Audio Recording
 Consider recording your audio separately, youll have more control over the placement of the microphone which greatly influence the quality. You can use an recording device, digital is recommended to save you the step of having to convert it later. If using a computer to the recording Audacity or VLC work well.

Converting to Digital
 Tool List
   Firewire Cable :
     4pin to 4pin  Camera to Small Port(Usually Laptop)
     4pin to 6pin  Camera to Large Port(Usually Desktop)
   Hard Drive Space 5min ≈ 1GB, which means 2 hours of video equals 24 GB

 Conversion
 Plug in your camera to your computer and turn it on to play/vcr mode. Then use one of the tools below to capture the video. Note unless you have a really cool camera that doesnt use tapes youre stuck at a 1:1 copy speed, which means it will take as long as the recording is to copy.
 || Linux || dvgrab  || http://www.kinodv.org/ || Command line example:$ sudo dvgrab timestamp format dv2 opendml size 2048 ||
 || Windows || virutaldub ||  http://www.virtualdub.org/ || Graphical Interface ||
 || Mac || || || ||

Encoding to Playable Formats
 Playable by who?
 You obviously cant go around giving people a 24GB video to watch, at least not with the current technology. For a home DVD burner the standard disc has 4.7GB so thats the maximum you should really work with(minus a little for menus, extras and overhead of writing the disc 4.5GB should be plenty of room)

 Encoding
 Sometimes called transcoding its the process of converting the video from one format to another. Depending on how much you like the command line and how many files you want to convert there are lots of software choices.

For this project we used a mix of the following which are all available for every OS in one form or another:
  Avidemux
   Graphical Tool  usable but not necessarily intuitive, has a lot of features to make the advanced user happy but isnt great for batching files.
   http://fixounet.free.fr/avidemux/

  mencoder
   Command Line  once you get a good command set you like its easy to repeat, check out my script file(MencoderExample.script) (Hint: its a text file, you can open it with any text editor) for converting all avi files in a folder to mpeg2 DVD format, compressing to make sure 2 hours will fit on 1 DVD.
   http://www.mplayerhq.hu/design7/news.html

 Handbrake
    Graphical Tool  Recommeded tool as it has common format presets. Fairly easy to use but occasionally doesnt like some input formats but does a fantastic job on compression.

You can also use:
  ffmpeg

They actually all borrow from each other, ffmpeg is embedded in Avidemux and mencoder for certain formats.

Distribution

Why not streaming media?: Its an option and people should feel free to explore, we didnt have complete access to a server where we could test all the possibilities. Its also a difficult task to tackle since Flash, Quicktime and RealMedia are all proprietary tools for embedding media in a webpage and that would exceed our budget and moral guidelines.

2011 Update: http://youtube.com Youtube and http://vimeo.com Vimeo provide reasonable options for this, though http://creativecommons.org Creative Commons integration is not perfect. The best part is that both of these sites will take most common formats and convert them into web optimized formats.

 Making an AudioCast
 ||Format  Options|| Pro || Con ||
 ||mp3|| Widely used, especially on devices || Proprietary Format ||
 ||wmv||  || Proprietary Format, Mostly available only to Windows users, Not supported on many devices||
 ||aac|| Widely used, sometimes on devices || Not supported on many devices ||
 ||ogg|| Free Open Source || Most people dont have the codec for it yet, Not supported on many devices ||
 Quality and compression is really about the same with all the formats. We choose mp3 simply because it would be the most widely compatible and the only format the would work with the http://podcast.ucdavis.edu UC Davis podcast site

 Making a VideoCast
 Making Video files becomes more complicated because there are 2 things you need pay attention to. The video format, which is the codec used to encode the stream, and the container which is the file format that you put your stream into. A good way to think of it is like a box, only certain things fit in the box and you need certain tools to open the box and not all boxes fit the same things or can be opened the same way.

 ||Container  Options|| Pro || Con ||
 || .avi || Widely compatible || Not Podcastable via http://podcast.ucdavis.edu UC Davis podcast site ||
 || .mp4 || The latest standard with good compression || A huge standard that is never fully implemented, making it hard to find the right settings ||
 || .mp2, mpeg2 || Widely Compatible, Standard format for DVDs || Not very efficient, doesnt go into a .mp4 ||
 || .ogg || Open Source || Not widely adopted. ||

 || Video Format  Options|| Pro || Con ||
 || x264 || Open Source implementation of h264 standard used by Apple for mp4 || Doesnt play nice with Quicktime out of the box ||
 || h263 || || ||
 || xvid || || ||

 || Audio Format  Options|| Pro || Con ||
 || .mp3 || Widely used, especially on devices || Proprietary Format ||
 || .aac || Widely used, especially on devices || Proprietary Format, Not as common as mp3 when used alone. ||
 || .ogg || Open Source || Not widely adopted. ||

 Making a DVD
   Formatting : The accepted DVD standard is mpeg2 formatting 720x480 with aac? Audio formating at 48000 kHz(Note this is higher than normal audio on minidv formats)
   Media : DVDR (4.7GB) work well with home DVD burners and are compatible with most industry standard DVD players.
   Menus : DVDStyler http://www.dvdstyler.de/

Archiving on the Internet
So it turns out that fitting 20 hrs of TV quality imagery on a single DVD is well, impossible. What were going for now is to upload the individual DVDs (4GB+) each to the http://www.archive.org/index.php Internet Archive and uploaded each of the individual audio files of the same lecture to the same site. Links will be posted as soon as the files are uploaded.
