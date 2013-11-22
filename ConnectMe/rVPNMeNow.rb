# @author Marius Küng
# @version 0.2 (2013-11-22)

# Resources
# http://www.weichel21.de/wordpress/2013/03/31/open-a-vpn-verbindung-on-mac-using-ruby/
# http://forums.macrumors.com/showthread.php?t=689066

require 'json'

class VPNMeNow

    action = ARGV[0]
    action ||= ''
    settingsFilePath = ARGV[1]
    settingsFilePath ||= 'settings.json'

    if !File.exists?(settingsFilePath) then
        puts settingsFilePath + " does not exist."
        exit
    end

    @settings = JSON.parse(File.read(settingsFilePath))

    def self.open()
        close() # close open connection
        cmd=[]
        cmd << "osascript <<-EOF"
        cmd << "tell application \"System Events\""
        cmd << "        tell current location of network preferences"
        cmd << "                set VPN to service \"#{@settings["SERVICE"]}\"" #% $settings["SERVICE"]
        cmd << "                if exists VPN then connect VPN"
        # cmd << "                repeat while (current configuration of VPN is not connected)"
        cmd << "                    key code 48 using {command down}"
        cmd << "                    delay 1"
        cmd << "                    keystroke \"#{@settings["PASSWORD"]}\"" #% $settings["PASSWORD"]
        cmd << "                    key code 36"
        # cmd << "                end repeat"
        cmd << "        end tell"
        cmd << "end tell"
        cmd << "EOF"

        cmd=cmd.join("\n")

        system(cmd)

    end


    def self.close
        cmd=[]
        cmd << "osascript <<-EOF"
        cmd << "tell application \"System Events\""
        cmd << "        tell current location of network preferences"
        cmd << "                set VPN to service \"#{@settings["SERVICE"]}\" -- your VPN name here"
        cmd << "                if exists VPN then disconnect VPN"
        cmd << "        end tell"
        cmd << "end tell"
        cmd << "EOF"

        cmd=cmd.join("\n")

        system(cmd)
    end

    if action == "open"
        self.open()
    elsif action == "close"
        self.close()
    end
end
