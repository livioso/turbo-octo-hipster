# @author Marius Küng
# @version 0.1 (2013-11-22)

def getFHNWWifi
    cmd = `/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk '/ SSID: / {print $2}'`

    if cmd.include? "eduroam"
        puts "You're connected to eduroam."
        return true
    end
    puts "You're not connected to eduroam."
    return false
end
