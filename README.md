turbo-octo-hipster
==================

Fancy scripts to improve life of a college student. ;)
Contains scripts which should help to make life simplier...

SyncMe
======

Script that allows you to synchronize folders from the FHNW to
your local hard drive using rsync.

Requirements:

	# 'json' is used to read settings.json and subjects.json
	$ gem install json

Usage:

	# Every day usage is simple => Sync all my subjects
	# specified in subjects.json
	$ ruby rSyncMeNow.rb

But you could also create your own fancy json subjects file per day
and then the script allows you to use these instead of the default
subjects.json. Assuming we would only like to synchronize subjects from
a particular day you could do something like this:

	# Today is Monday. So why would I want to sync
	# everything? I'm only interested in todays subjects.
	$ ruby rSyncMeNow.rb monday.json

PloneMe
=======

This script simply you to mirror the content of "plone" to your local hard drive.
=> This one is only a proof of concept yet. Feel free to contribute. :)

ConnectME
=========

rVPNMeNow.rb
------------

Requirements:

    # 'json' is used to read settings.json
    $ gem install json

Usage:

    $ ruby rVPNMeNow.rb

Connects you to the school VPN via Applescript. It also requires a given
settings.json file with your Account credentials.

rCheckWifi.rb
-------------

Checks if you're connected to the school Wifi.

rADMeNow.rb
-----------

This script connects and opens the Active Directory. For now it doesn't check
if you are connected to the FHNW Wifi or VPN.
