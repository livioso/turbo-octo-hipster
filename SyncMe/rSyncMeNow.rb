#! /usr/bin/ruby

# Get your study documents automatically from active directory
# @author Marius Küng and Livio Bieri

require 'json'
require 'optparse'

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

    opts.on('-v', '--vpn [OPT]', 'Connect to VPN before syncing.') do |settingUserPath|
        options[:connectVPN] = true
    end

    # setting default files if necessary
    options[:subjectsFilePath] = options[:subjectsFilePath] || File.join(File.dirname(__FILE__), 'subjects.json')
    options[:settingsFilePath] = options[:settingsFilePath] || File.join(File.dirname(__FILE__), 'settings.json')
    options[:connectVPN] = options[:connectVPN] || false

end.parse!

begin
    subjects = JSON.parse(File.read(options[:subjectsFilePath]))
    settings = JSON.parse(File.read(options[:settingsFilePath]))
rescue => exception
    puts "Ooops! Error while parsing files. => Detailed error description: \n" + exception.message 
    exit
end

if options[:connectVPN]
    vpnConnectCommand = settings["VPN_CONNECTCOMMAND"]
    puts settings["VPN_CONNECTCOMMAND"]
    system(vpnConnectCommand)
end

unless File.directory?(settings["SOURCE_PATH"])
    puts 'Ooops. Connection was not found to active directory. => Connect active directory first. :-('
    exit
end

subjects["subjects"].each do |subject|

    subjectMirrorFolder = "%s/%s%s/%s/" % [settings["USER_PATH"], subject['prefix'], subject['name'], settings["MIRROR_PATH"]]
    puts " => %s%s [%s]" % [subject['prefix'], subject["name"], subjectMirrorFolder]

    # if target directory doesn't exist create it
    unless File.directory?(File.expand_path(subjectMirrorFolder))
        system("mkdir -p %s" % subjectMirrorFolder)
    end

    # how to build a path:
    # SOURCE_PATH/<directory of class>/<directory of subject>/* /USER_PATH/<subject>/MIRROR_PATH
    rsync = "rsync %s %s%s/%s/* %s/%s%s/%s/" %
    [
        settings["RSYNC_PARAMETER"],
        settings["SOURCE_PATH"],
        subject['directory'],
        subject['name'],
        settings["USER_PATH"],
        subject['prefix'],
        subject['name'],
        settings["MIRROR_PATH"]
    ]
    system(rsync)
end