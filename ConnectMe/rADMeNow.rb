# @author Marius Küng
# @version 0.1 (2013-11-22)
# open smb://fsemu18.edu.ds.fhnw.ch/e_18_data11\$/

load(File.join(File.dirname(__FILE__),'rCheckWifi.rb'))
load(File.join(File.dirname(__FILE__),'rVPNMeNow.rb'))

if !File.directory?("/Volumes/e_18_data11$") then
    if(!getFHNWWifi)
        VPNMeNow::open()
        sleep(4) # wait 4 seconds to input password
    end
    system "open smb://fsemu18.edu.ds.fhnw.ch/e_18_data11\$/"

else
    puts "Your're already connected to the Active Directory!"
end

# eject volume:
# diskutil unmount /Volumes/e_18_data11\$/
