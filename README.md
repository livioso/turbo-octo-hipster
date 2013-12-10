turbo-octo-hipster
==================

Fancy scripts to improve life of a college student. ;)
Contains scripts which should help to make life simpler...

SyncMe
======

Script that allows you to synchronize folders from the FHNW to
your local hard drive using rsync.

Requirements:

	# the following gems are required in order to use rSyncMeNow.rb
	$ gem install json
	$ gem install require_relative
	$ gem install optparse

Usage:

	# Every day usage is simple => Sync all my subjects
	# specified in subjects.json
	$ ./rSyncMeNow.rb

But you can also create your own fancy json subjects file per day
and then the script allows you to use these instead of the default
subjects.json. Assuming we would only like to synchronize subjects from
a particular day you could do something like this:

	# Today is Monday. So why would I want to sync
	# everything? I'm only interested in todays subjects.
	$ ./rSyncMeNow.rb -s monday.json

If you want to use another settings files this can be done by like this:

	$ ./rSyncMeNow.rb -c usersettings.json

Also check out the your help for further information:

	$ ./rSyncMeNow.rb --help

ConnectME
=========

rVPNMeNow.rb
------------

Requirements:

    # 'json' is used to read settings.json
    $ gem install json

Usage:

    $ ruby rVPNMeNow.rb <action (open/close)> <settings>
    # example: ruby rVPNMeNow.rb open settings.json
    # example: ruby rVPNMeNow.rb close

Connects you to the school VPN via Applescript. It also requires a given
settings.json file with your Account credentials.

rCheckWifi.rb
-------------

Checks if you're connected to the school Wifi.

Usage:

    $ ruby rCheckWifi.rb

rADMeNow.rb
-----------

This script connects and opens the Active Directory.
If you're not connected to the VPN it does it for you.

Usage:

    $ ruby rADMeNow.rb
