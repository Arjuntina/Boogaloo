#!/bin/bash

# Author: Arjun Patel
# Date: 6/16/23
# About: Fun lil program to merge the contents of a bunch of folders into one master folder in the same directory & number them numerically :)
# Hopefully get to learn a bit more about bash/shell programming along the way


# How to use:
# Put all folders into one directory
# Run the script!


# Folder location with all the subfolders -- prompt user to enter it?
FOLDERLOC="/home/arjuntina/Files/OnePiece"


# Navigate to specified folder location and create "master" folder fo all the files to be copied into
(
cd -- "$FOLDERLOC"
mkdir "master"

# Counter for the number of files in the "master" folder
I=0

for FOLDER in *
do
	if [ ! "$FOLDER" = "master" ] && [-d "$FOLDER" ]
	then
		cd -- "$FOLDER"
		for FILE in *
		do
			I=`expr $I + 1`
		done
		cd ..
	fi
done

echo "$I files will be combined"

K=$I

# Counter for the number of folders combined into a "master" folder
J=0

# Loop over all folders in directory
for FOLDER in *
do
    echo $FOLDER
    # If folder is not the master folder, then we navigate to it and copy all the files over.
    if [ ! "$FOLDER" = "master" ]
    then
        cd -- "$FOLDER"
        echo $FOLDER
        # Loop through every file in each subdirectory
        for FILE in *
        do
            # Name every folder as the index looped over & count the index down
            mv "$FILE" "$I.jpg"
            mv "$I.jpg" "$FOLDERLOC/master"
            I=`expr $I - 1`
        done
        # move back to parent directory and iterate by 1
        cd -- ..
        J=`expr $J + 1`
    fi
done

# Displays the number of files & folders moved over to the user 
echo "$K files from $J folders copied and moved over"
)
