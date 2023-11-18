#!/bin/bash

# Author: Arjun Patel
# Date: 6/16/23
# About: Fun lil program to merge the contents of a bunch of folders into one master folder in the same directory & number them numerically :)
# Hopefully get to learn a bit more about bash/shell programming along the way


# How to use:
# Put all folders into one directory
# Run the script!


# Folder location with all the subfolders -- prompt user to enter it?
target_dir="/home/arjuntina/Files/OnePiece"


# Navigate to specified folder location and create "master" folder fo all the files to be copied into
(
cd -- "$target_dir"
mkdir "master"

# Counter for the number of files in the "master" folder
i=0

for folder in *
do
	if [ ! "$folder" = "master" ] && [-d "$folder" ]
	then
		cd -- "$folder"
		for file in *
		do
			i=`expr $i + 1`
		done
		cd ..
	fi
done

echo "$i files will be combined"

k=$i

# Counter for the number of folders combined into a "master" folder
j=0

# Loop over all folders in directory
for folder in *
do
    echo $folder
    # If folder is not the master folder, then we navigate to it and copy all the files over.
    if [ ! "$folder" = "master" ]
    then
        cd -- "$folder"
        echo $folder
        # Loop through every file in each subdirectory
        for file in *
        do
            # Name every folder as the index looped over & count the index down
            mv "$file" "$i.jpg"
            mv "$i.jpg" "$target_dir/master"
            i=`expr $i - 1`
        done
        # move back to parent directory and iterate by 1
        cd -- ..
        j=`expr $j + 1`
    fi
done

# Displays the number of files & folders moved over to the user 
echo "$k files from $j folders copied and moved over"
)
