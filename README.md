turbo-octo-hipster
==================

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=livioso&url=https://github.com/livioso/turbo-octo-hipster&title=turbo-otco-hipster&language=&tags=github&category=software)

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

**Also required is rsync!**

Usage:

    # Every day usage is simple => Sync all my subjects
    # specified in subjects.json
    $ ./rSyncMeNow.rb

**Remember to rename (remove '-example') your custom settings.json and subjects.json before first usage!
This makes sure you can always pull the latest code from GitHub without losing your custom settings.**

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
    
