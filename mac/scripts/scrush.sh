#!/bin/bash
set -e
scrot $@ /tmp/scrot.png;
json=$(curl -F file=@/tmp/scrot.png https://mediacru.sh/api/upload/file)
hash=$( echo "$json" | grep "hash" | cut -d '"' -f4)
xdg-open https://mediacru.sh/$hash
