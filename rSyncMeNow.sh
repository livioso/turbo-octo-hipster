#! /bin/bash

# if [ ! -d /Volumes/e_18_data11$ ]; then
	# that fucker has not been mounted yet!
	# assuming we have a working connection
	# (we are on site or via VPN) we're going to do it ourselves now.
	#  mkdir /Volumes/e_18_data11$
	#  mount_smbfs smb://fsemu18.edu.ds.fhnw.ch/e_18_data11$ /Volumes/e_18_data11$
# fi

# here we go... we have access now thus we're
# ready to sync all that crap = mirroring

# SAMPLE WITH VARIABLES

# SOURCE_PATH="/Volumes/e_18_data11$/"
# USER_PATH="/Users/studentname/Desktop/Test/"
# MIRROR_PATH="/__remotemirror"

# # how to build a path:
# # SOURCE_PATH/<directory of class>/<directory of subject>/* /USER_PATH/<subject>/MIRROR_PATH

# # mgli
# rsync -avrz --delete --progress ${SOURCE_PATH}E1862_Unterrichte_I/E1862_1iCbb/mgli/* ${USER_PATH}mgli${MIRROR_PATH}

# mgli
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1862_Unterrichte_I/E1862_1iCbb/mgli/* /Users/livio/Dropbox/FHNW/mgli/__remotemirror

# lag1
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1862_Unterrichte_I/E1862_1Ia/lag/* /Users/livio/Dropbox/FHNW/lag1/__remotemirror

# fprog
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1862_Unterrichte_I/E1862_1Ia/fprog/* /Users/livio/Dropbox/FHNW/fprog/__remotemirror

# bec1
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1868_Unterrichte_Kontext/E1868_7KEc/ebec1/* /Users/livio/Dropbox/FHNW/bec1/__remotemirror

# agrh
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1868_Unterrichte_Kontext/E1868_7KKa08/agrh/* /Users/livio/Dropbox/FHNW/agrh/__remotemirror

# dtpC
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1862_Unterrichte_I/E1862_1iCa/dtpC/* /Users/livio/Dropbox/FHNW/dtpC/__remotemirror

# infge
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1868_Unterrichte_Kontext/E1868_7KGb/infge/* /Users/livio/Dropbox/FHNW/infge/__remotemirror

# ws1c
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1862_Unterrichte_I/E1862_1iCa/ws1C/* /Users/livio/Dropbox/FHNW/ws1c/__remotemirror

# sweGL
rsync -avrz --delete --progress /Volumes/e_18_data11$/E1862_Unterrichte_I/E1862_1iCa/sweGL/* /Users/livio/Dropbox/FHNW/sweGL/__remotemirror



