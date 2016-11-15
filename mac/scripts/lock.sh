#!/bin/bash

# Dependencies: imagemagick, i3lock-color-git, scrot

IMAGE=/tmp/i3lock.png

VALUE="60" #brightness value to compare to
scrot $IMAGE
convert $IMAGE -level 0%,100%,0.6 -resize 50% -blur 5x3 -resize 200% -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+160 'Type password to unlock' - | composite -gravity center /home/lutzee/scripts/i3lock-fancy/lock.png - $IMAGE
i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c  -i $IMAGE
rm $IMAGE
