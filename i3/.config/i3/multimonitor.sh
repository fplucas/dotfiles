#!/bin/bash

monitors=$(xrandr --listproviders | head -1 | awk '{ print $4 }')

if  [ "$monitors" -eq "3" ]; then
    . $HOME/.screenlayout/multimonitor.sh
    workspace $ws1 output DVI-1-1
    workspace $ws2 output DVI-1-1
    workspace $ws3 output DVI-1-1
    workspace $ws4 output DVI-2-2
    workspace $ws5 output DVI-2-2
    workspace $ws6 output DVI-2-2
    workspace $ws7 output eDP
    workspace $ws8 output eDP
    workspace $ws9 output eDP
else
    . $HOME/.screenlayout/laptop.sh
    workspace $ws1 output eDP
    workspace $ws2 output eDP
    workspace $ws3 output eDP
    workspace $ws4 output eDP
    workspace $ws5 output eDP
    workspace $ws6 output eDP
    workspace $ws7 output eDP
    workspace $ws8 output eDP
    workspace $ws9 output eDP

fi
