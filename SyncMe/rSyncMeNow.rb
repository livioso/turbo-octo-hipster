#! /usr/bin/ruby

# Get your study documents automatically from active directory
# @author Marius Küng and Livio Bieri

require 'json'
require 'optparse'
require 'rsync'

# by default UTF_8 is used but this causes problems 
# with umlauts in file and folder names (in rsync gem)
Encoding.default_internal = Encoding::ISO_8859_1
Encoding.default_external = Encoding::ISO_8859_1

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

    sourcePath = "%s%s/%s/*" % [
        settings["SOURCE_PATH"], 
        subject['directory'], 
        subject['name']
    ]

    destinationPath = "%s/%s%s/%s/" % [
        settings["USER_PATH"], 
        subject['prefix'], 
        subject['name'], 
        settings["MIRROR_PATH"]
    ]

    rsyncParams = settings["RSYNC_PARAMETER"]

    # if target directory doesn't exist create it
    unless File.directory?(File.expand_path(destinationPath))
        system("mkdir -p %s" % destinationPath)
    end

    puts " => %s%s [%s]" % [subject['prefix'], subject["name"], destinationPath]

    Rsync.run(sourcePath, destinationPath, rsyncParams) do |result|
     if result.success?
        result.changes.each do |change|
        end
      else
        puts " ---> #{result.error}"
      end
    end
end