# @author Marius Küng
# @version 0.1 (2013-11-22)

# Resources
# http://www.weichel21.de/wordpress/2013/03/31/open-a-vpn-verbindung-on-mac-using-ruby/
# http://forums.macrumors.com/showthread.php?t=689066

class VpnOnMac

  def self.open(service)
    cmd=[]
    cmd << "osascript <<-EOF"
    cmd << "tell application \"System Events\""
    cmd << "        tell current location of network preferences"
    cmd << "                set VPN to service \"#{service}\" -- your VPN name here"
    cmd << "                if exists VPN then connect VPN"
    # cmd << "                repeat while (current configuration of VPN is not connected)"
    cmd << "                    key code 48 using {command down}"
    cmd << "                    delay 1"
    cmd << "                    keystroke \"<password>\""
    cmd << "                    key code 36"
    # cmd << "                end repeat"
    cmd << "        end tell"
    cmd << "end tell"
    cmd << "EOF"

    cmd=cmd.join("\n")

    system(cmd)
  end


  def self.close(service)
    cmd=[]
    cmd << "osascript <<-EOF"
    cmd << "tell application \"System Events\""
    cmd << "        tell current location of network preferences"
    cmd << "                set VPN to service \"#{service}\" -- your VPN name here"
    cmd << "                if exists VPN then disconnect VPN"
    cmd << "        end tell"
    cmd << "end tell"
    cmd << "EOF"

    cmd=cmd.join("\n")

    system(cmd)
  end

end

VpnOnMac::open("VPN FHNW")
# VpnOnMac::close("VPN FHNW")
