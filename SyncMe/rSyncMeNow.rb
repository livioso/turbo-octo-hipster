# Get your study documents automatically from active directory
#
# @author Marius Küng
# @version 0.1 (2013-11-21)

# we are the cool kids so we need json here
require 'json'

# Check if Active Directory is around
if !File.directory?("/Volumes/e_18_data11$") then
    puts "No connection found to active directory. Hell no!"
    exit
end

# either use the files given as 
# parameter or use the default ones
# if none are set as parameters
subjectsFilePath = ARGV[0]
settingsFilePath = ARGV[1]
subjectsFilePath ||= 'subjects.json'
settingsFilePath ||= 'settings.json'

if !File.exists?(subjectsFilePath) then
    puts subjectsFilePath + " does not exist."
    exit
end

if !File.exists?(settingsFilePath) then
    puts settingsFilePath + " does not exist."
    exit
end

subjects = JSON.parse(File.read(subjectsFilePath))
settings = JSON.parse(File.read(settingsFilePath))

subjects["subjects"].each do |subject|

    subjectMirrorFolder = "%s/%s/%s/" % [settings["USER_PATH"], subject['name'], settings["MIRROR_PATH"]]

    puts " => %s [%s]" % [subject["name"], subjectMirrorFolder]

    # if target directory doesn't exitst
    if !File.directory?(File.expand_path(subjectMirrorFolder)) then
        system("mkdir -p %s" % subjectMirrorFolder)
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

