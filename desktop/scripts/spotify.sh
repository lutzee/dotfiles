#!/bin/bash

SPOTIFY=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

ARTIST=$(echo "$SPOTIFY" | grep -e 'artist' -A2 )
ARTIST=$(echo "$ARTIST" | grep -e 'string' | awk -F '"' '{print $2}' | sed -e 's/xesam:artist//g' | tr -d '\n')

SONG=$(echo "$SPOTIFY"  | grep -e 'title' -A1) 
SONG=$(echo "$SONG" | grep -e 'variant' | awk -F '"' '{print $2}')
echo "$ARTIST" "|" "$SONG"
