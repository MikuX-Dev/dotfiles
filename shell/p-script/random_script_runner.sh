#!/bin/bash

# Define an array of scripts in the scripts directory
script_directory="$HOME/bin/scripts"
scripts=($script_directory/*)

# Choose a random script from the array
random_script=${scripts[$RANDOM % ${#scripts[@]}]}

# Check if the chosen file is executable and run it if it is
if [[ -x "$random_script" ]]; then
    "$random_script"
else
    echo "Error: $random_script is not executable."
fi

