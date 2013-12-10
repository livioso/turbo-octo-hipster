#! /usr/bin/ruby

# Get your study documents automatically from active directory
# @author Marius Küng and Livio Bieri

require 'json'
require 'optparse'
require 'require_relative'

# make sure that keys which have not been 
# set in the hash map return nil so we can use ||
options = Hash.new(nil) 

OptionParser.new do |opts|
    opts.banner = 'Usage: rSyncMeNow.rb [optional parameters]'
    opts.on('-s', '--subjects [OPT]', 'Absolute path to a subject file.') do |subjectUserPath|
        options[:subjectsFilePath] = subjectUserPath
    end
    opts.on('-c', '--settings [OPT]', 'Absolute path to a setting file.') do |settingUserPath|
        options[:settingsFilePath] = settingUserPath
    end

    # setting default files if necessary
    options[:subjectsFilePath] = options[:subjectsFilePath] || './subjects.json'
    options[:settingsFilePath] = options[:settingsFilePath] || './settings.json'

end.parse!

begin 
    subjects = JSON.parse(File.read(options[:subjectsFilePath]))
    settings = JSON.parse(File.read(options[:settingsFilePath]))
rescue
    puts 'Ooops! Error while parsing files. => Make sure specified files are valid. :-('
    exit
end

if not File.directory?(settings["SOURCE_PATH"]) then
    puts 'Ooops. Connection was not found to active directory. => Connect active directory first. :-('
    exit
end

subjects["subjects"].each do |subject|

    subjectMirrorFolder = "%s/%s/%s/" % [settings["USER_PATH"], subject['name'], settings["MIRROR_PATH"]]
    puts " => %s [%s]" % [subject["name"], subjectMirrorFolder]

    # if target directory doesn't exist create it
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
    system( rsync )
end