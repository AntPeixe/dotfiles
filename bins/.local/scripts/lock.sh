#!/bin/bash
# partially taken from github.com/savoca/dotfiles/blob/gray/home/.bin/scripts/lock.sh

# PRIMARY_SCREEN_COORD=$(xrandr | grep '\Wprimary\W' | grep -Po "\d+x\d+\+\d+\+\d+" | sed 's/x/+/' | awk -F "+" '{print $1"x"$2"+"$3"+"$4}' | head -n 1 | tail -n 1)
maim -B -u /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
i3lock -i /tmp/screen.png
rm /tmp/screen.png

