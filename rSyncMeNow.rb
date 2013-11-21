# Get your study documents automatically from active directory
#
# @author Marius Küng
# @version 0.1 (2013-11-21)

# Check if Active Directory is around
if !File.directory?("/Volumes/e_18_data11$") then
    puts "Keine Verbindung zu Active Directory!"
    exit
end

settings = {
    "SOURCE_PATH" => "/Volumes/e_18_data11$/",
    "USER_PATH" => "~/Desktop/Test",
    "MIRROR_PATH" => "__remotemirror"
}
subjects = [
    {'name' => 'mgli', 'directory' => 'E1862_Unterrichte_I/E1862_1iCbb'},
    {'name' => 'oopI1', 'directory' => 'E1862_Unterrichte_I/E1862_1iCa'},
    {'name' => 'lag', 'directory' => 'E1862_Unterrichte_I/E1862_1Ia'},
]

for i in subjects do

    puts i["name"]

    current_user_path = "%s/%s/%s/" % [settings["USER_PATH"], i['name'], settings["MIRROR_PATH"]]

    # if target directory doesn't exitst
    if !File.directory?(current_user_path) then
        system("mkdir -p %s/%s" % [settings["USER_PATH"], i['name']])
        system("mkdir -p %s/%s/%s" % [settings["USER_PATH"], i['name'], settings["MIRROR_PATH"]])
    end

    # how to build a path:
    # SOURCE_PATH/<directory of class>/<directory of subject>/* /USER_PATH/<subject>/MIRROR_PATH
    rsync = "rsync -avrz --delete --progress %s/%s/%s/* %s/%s/%s/" %
    [
        settings["SOURCE_PATH"],
        i['directory'],
        i['name'],
        settings["USER_PATH"],
        i['name'],
        settings["MIRROR_PATH"]
    ]
    system( rsync ) # run a shell command: system ("<command>")
end

