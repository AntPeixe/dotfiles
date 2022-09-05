#!/usr/bin/bash

# make all files under bins executable
find bins/ -type f | xargs chmod u+x

folders=`find -maxdepth 1 -type d -not -path "**/\.**" -not -name '.' | xargs basename -a | xargs`

echo "stowing $folders"
stow -D $folders
stow $folders

