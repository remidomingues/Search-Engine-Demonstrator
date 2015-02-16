tl;dr: the wikispot.org server had an outage today. Everything should be good now and no edits were lost. For logistical reasons, we weren’t able to bring the server back online. The server is now running on Amazon’s EC2 and was restored from backup over a series of many laborious hours. We planned to shut down this old server on Friday anyway. We need more people to help with this kind of thing in the future.

 Ultranerdy background information: 

     The physical machine that the wikispot.org VPS was hosted on was set to be decommissioned this Friday, and we planned to migrate to a new server sometime before then.
     The physical machine the wikispot.org VPS was hosted on was owned by Amit, a volunteer from years back.  We ended up sort of taking ownership of the server once Amit and his friends stopped using the machine.  The server, and us (LocalWiki), were a part of a hosting cooperative called Cernio which Graham founded way back when.  The coop has recently reincorporated as iocoop and is going through a bunch of (positive) changes, such as decommissioning the current colo infastructure in San Francisco.

Around 10AM this morning I got a few emails about DavisWiki.org and the wikispot.org sites being down.  I didn’t receive an uptime notification via SMS (via pingdom, siteuptime or other means).  I was at a friend’s house and didn’t have access to my laptop in the morning, nor did I have SSH keys, etc on my new iPhone.

I texted Graham and Mike to see if they could investigate.  Graham, who was at work at the time, was slammed with meetings and wasn’t able to dive in, but he was able to figure out that the parent server that wikispot.org was hosted on (the VPS host) was down.

Once I got to my laptop, about 1.5 hours later, I was able to contact some folks at the hosting coop the parent server is housed in and, after about 45 minutes, was able to get one of the coop volunteers to power cycle the server’s PDU.  Unforuntately, this didn’t seem to bring the domU (wikispot.org) back online, and I wasn’t able to SSH into the dom0 (amit.cernio.com).  I never administered this particular parent server, so I was unsure whether not being able to SSH in was unusual.

Gene, the coop volunteer, suggested that I find someone from the coop with physical access to the colo and head there to investigate more.  Heading to the colo to investigate seemed like it would take a while and could produce uncertain results e.g. if a drive was dead or the machine needed tweaking.  It could have been something as simple as a cord getting knocked, though.  But at minimum, it’d probably be several hours to get a volunteer with physical access to meet with us at the colo, and I wasn’t confident that I’d have the skills to fix up the dom0  I’ve never administered a Xen host.

So as a contingency, I begun the process of restoring the server completely from our backups.  I began following the instructions in our “wikispot / localwiki backup” Google Doc to restore the server on a new EC2 instance.  I set up an EC2 instance  m1.medium with EBS instance storage (8GB) as well as an attached EBS volume (300GB) for the database.

I picked Ubuntu 8.04 (old) for the OS because that’s what the old machine was running  this was recommended in the backup restore howto Google Doc.  I needed to use 8.04  or at least something with PostgreSQL 8.3  to restore the backup.  I transfered the backup from web01.msp01.localwiki.org to the new EC2 instance and began the process of restoring it using the restoration instructions.  After restoring it, I checked it for consistency and it appeared that no edits were lost.  This is because we ship all database changes as they happen  a sort of cold replication.

Next up was restoring the machine files  /etc/, as well as setting up services as they were set up on the old wikispot.org server.  Details not in backup howto: I installed the backup_to_s3 command from web01 (I also have a copy of this on my local system, as do Graham and Mike), which has S3 credentials in it.  I also set up the same version of duplicity that was used to do the backups and configured it.  I set the backup_to_s3 script to enable encryption (which was disabled) and ran it as ./backup_to_s3 restore, after changing the DESTINATION variable to point to the /srv/wikispot.org/machine_files/ S3 bucket.

I didn’t move over the restored /etc/ wholesale and instead opted to pick a few essentials.  I installed lighttpd and copied over those config files.  I also copied the lighttpd init.d script to create lighttpdssl, which was needed to serve SSL.

After installing a few python packages  aptget install pythonsetuptools; aptget install pythonimaging; aptget install pythonpsycopg2; aptget install memcached;  I then tested out the main wikispot python script by running, inside of the sycamore_base directory, share/web/index.scgi.  It appeared to run fine when run as the wikispot user, which I had to create on the system.  Turning on lighttpd and hitting the server’s IP brought up the wikispot.org homepage good stuff.

I then loadtested the setup and noticed it wasn’t as fast as expected  only around 12 requests/second on some fairly basic pages.  I then noticed that I had to copy over the memcached config file  or, at the very least, set memcached to be on the same port as the wikispot stuff was expecting.

I also copied over the postgresql.conf file containing our database optimizations, commenting outthe archive stuff that was shipping WAL logs to web01.  I commented this out because the new machine didn’t yet have credentials to connect to web01.

At this point things looked like they were mostly working, but I was doing most of this restoration work on /mnt which was the EC2 instance storage, not EBS.  I created a 300GB EBS volume, attached it to the instance, and then moved over the contents of /mnt to the new EBS and shuffled them around, making /mnt the new EBS volume.

I created an Elastic IP Address and assigned it to the instance.  I then updated wikispot.org, daviswiki.org DNS to point to the new IP.

I confirmed several times that everything came up after rebooting the system.  There’s still several things to do, but I’m crazy tired so I’m ending this here :)

Users/PhilipNeustrom



Want to help with this kind of thing in the future?  Shoot an email to philip@localwiki.org!
