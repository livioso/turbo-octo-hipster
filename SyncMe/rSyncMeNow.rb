# Get your study documents automatically from active directory
#
# @author Marius Küng
# @version 0.1 (2013-11-21)

# we are the cool kids so we need json here
require 'json'

# Check if Active Directory is around
if !File.directory?("/Volumes/e_18_data11$") then
    puts "Keine Verbindung zu Active Directory!"
    exit
end

settings = JSON.parse(File.read('settings.json'))
subjects = JSON.parse(File.read('subjects.json'))

subjects["subjects"].each do |subject|

    puts subject["name"]

    current_user_path = "%s/%s/%s/" % [settings["USER_PATH"], subject['name'], settings["MIRROR_PATH"]]

    # if target directory doesn't exitst
    if !File.directory?(current_user_path) then
        system("mkdir -p %s/%s" % [settings["USER_PATH"], subject['name']])
        system("mkdir -p %s/%s/%s" % [settings["USER_PATH"], subject['name'], settings["MIRROR_PATH"]])
    end

    # how to build a path:
    # SOURCE_PATH/<directory of class>/<directory of subject>/* /USER_PATH/<subject>/MIRROR_PATH
    rsync = "rsync -avrz --delete --progress %s/%s/%s/* %s/%s/%s/" %
    [
        settings["SOURCE_PATH"],
        subject['directory'],
        subject['name'],
        settings["USER_PATH"],
        subject['name'],
        settings["MIRROR_PATH"]
    ]
    system( rsync ) # run a shell command: system ("<command>")
end

