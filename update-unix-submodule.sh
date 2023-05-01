#!/bin/bash

# get the path of each submodule listed in .gitmodules
submodules=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')

# loop through each submodule and checkout the main or master branch
for submodule in $submodules
do
    echo "Updating submodule $submodule"
    cd ./$submodule
    if [ -z "$(ls -A .)" ]; then
        echo "Submodule folder is empty. Initializing submodule..."
        git submodule update --init
        git checkout main || git checkout master
    else
        git checkout main || git checkout master
        git pull
    fi
    cd /home/pureleaf/Documents/session-8/
done
