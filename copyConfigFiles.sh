#!/bin/zsh

# Folder location of config files
config_folder_loc="/home/arjuntina/.config"

# Target location of config files
target_dir_loc="/home/arjuntina/Backups/programConfigFiles"

# folders within config directory I DON'T want to back up
# mainly because they take up space + not particularly useful
# To-do: prompt users to review/potentially edit this during runtime? hmm
folders_to_exclude=("discord" "Slack" "zoom" "zoom.us" "zoom.conf" "VSCodium" "chromium")

# Subshell
# Copy the config folder to the target location and systematically remove those listed in the folders_to_exclude array
(
# navigate to the target directory
cd -- "$target_dir_loc"

# remove existing config folder backup & copy current config folder backup to the new location
rm -rf ".config"
echo "Existing config folder removed"
cp -rf "$config_folder_loc" "$target_dir_loc"
echo -e "New config folder copied\n"

# Enter into the config folder backup 
cd ".config"

echo "Removing unwanted folders & files..."
for i in {1..${#folders_to_exclude[@]}}
do
    rm -rf "${folders_to_exclude[$i]}"
    echo "removed ${folders_to_exclude[$i]}"
done
echo -e "Done\n"

# Output the current size of the config directory
cd ..
echo "Current size of the .config backup"
du -hs

)

# Unset the variables defined in the expression above?
# Should already be unset but idk if this is good practice
unset config_folder_loc
unset target_dir_loc
unset folders_to_exclude
