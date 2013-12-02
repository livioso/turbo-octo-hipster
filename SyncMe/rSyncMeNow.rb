#! /usr/bin/ruby

# Get your study documents automatically from active directory
#
# @author Marius Küng
# @version 0.1 (2013-11-21)

# we are the cool kids so we need json here
require 'json'
require 'optparse'


options = {
    # defaulting to subjects.json and settings.json assuming 
    # they are located under the same path as the script itself
    :subjectsFilePath => File.join(File.dirname(__FILE__),'subjects.json'),
    :settingsFilePath => File.join(File.dirname(__FILE__),'settings.json')
}

OptionParser.new do |opts|
    opts.banner = "Usage: rSyncMeNow.rb [options]"
    opts.on("-s", "--subjects", "Subjects json file") do |s|
        options[:subjectsFilePath] = s
    end
    opts.on("-c", "--settings", "Settings json file") do |c|
        options[:subjectsFilePath] = c
    end
end.parse!

begin 
    subjects = JSON.parse(File.read(options[:subjectsFilePath]))
    settings = JSON.parse(File.read(options[:settingsFilePath]))
rescue
    puts " => Ooops. Error while parsing files. :-/ \n" +
         "    Verify your subjects and settings file. \n" +
         "    Make sure they are existing and valid. Aborting."
    exit
end

# Check if Active Directory is around
if not File.directory?(settings["SOURCE_PATH"]) then
    puts "No connection found to active directory. Hell no!"
    exit
end

subjects["subjects"].each do |subject|

    subjectMirrorFolder = "%s/%s/%s/" % [settings["USER_PATH"], subject['name'], settings["MIRROR_PATH"]]

    puts " => %s [%s]" % [subject["name"], subjectMirrorFolder]

    # if target directory doesn't exitst
    if !File.directory?(File.expand_path(subjectMirrorFolder)) then
        system("mkdir -p %s" % subjectMirrorFolder)
    end

    # how to build a path:
    # SOURCE_PATH/<directory of class>/<directory of subject>/* /USER_PATH/<subject>/MIRROR_PATH
    rsync = "rsync %s %s/%s/%s/* %s/%s/%s/" %
    [
        settings["RSYNC_PARAMETER"],
        settings["SOURCE_PATH"],
        subject['directory'],
        subject['name'],
        settings["USER_PATH"],
        subject['name'],
        settings["MIRROR_PATH"]
    ]
    system( rsync ) # run a shell command: system ("<command>")

end