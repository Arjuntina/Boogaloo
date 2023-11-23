#!/bin/bash

# script to run a randomly curated neofetch config each time neofetch is entered into the terminal
# for the rice :)
# done with chatGPT in like 2 min haha




# To-do
# maybe fork neofetch to do this without external script? hm hm 
# backend may be difficult

# Specify the directory containing the files
directory="/home/arjuntina/.config/neofetch/allConfigs"

# Check if the specified directory exists
if [ -d "$directory" ]; then

    # Get a list of files in the directory
    files=("$directory"/*)

    # Check if there are any files in the directory
    if [ ${#files[@]} -gt 0 ]; then
        # Get the length of the array
        length=${#files[@]}

        # Generate a random index within the array bounds
        random_index=$((RANDOM % length))

        # run neofetch with the random config!
        neofetch --config ${files[random_index]}
    else
        echo "Error: No files found in the specified directory."
    fi
else
    echo "Error: The specified directory does not exist."
fi

