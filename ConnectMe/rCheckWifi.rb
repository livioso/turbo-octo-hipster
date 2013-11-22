def getFHNWWifi
    cmd = `/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk '/ SSID: / {print $2}'`

    if cmd.include? "eduroam"
        return true
    end
    return false
end
