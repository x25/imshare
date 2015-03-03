#!/bin/bash

function upload {
  response=$(curl -F "key=$key" -H "Expect: " -F "image=@$file" \
    http://imgur.com/api/upload.xml 2>/dev/null)

  if [ $? -ne 0 ]; then

    echo "Upload failed" >&2
    return 255

  elif [ $(echo $response | grep -c "<error_msg>") -gt 0 ]; then

    echo "Error message from imgur:" >&2
    echo $response | sed -r 's/.*<error_msg>(.*)<\/error_msg>.*/\1/' >&2
    return 255
  fi

  url=$(echo $response | sed -r 's/.*<original_image>(.*)<\/original_image>.*/\1/')
  deleteurl=$(echo $response | sed -r 's/.*<delete_page>(.*)<\/delete_page>.*/\1/')

  echo $url
  echo "Delete url: $deleteurl" >&2

  echo $(date) >> $log
  echo "Url: $url" >> $log
  echo "Delete url: $deleteurl" >> $log
}

function process {
  paplay $sound 2>/dev/null

  link=$(upload $1)

  if [ -z "$link" ]; then
    return 255
  fi

  echo -n $link | xclip
  echo -n $link | xclip -selection c

  notify-send "Image uploaded" "URL has been copied to clipboard" -i imshare

  return 0
}

settings="$HOME/.imshare.conf"
key="486690f872c678126a2c09a9e196ce1b"
capture_tool="gnome-screenshot -a -f"
log="$HOME/.imshare.log"
sound="/usr/share/sounds/freedesktop/stereo/screen-capture.oga"

if [ -f "$settings" ]; then
  source "$settings"
fi

if [ -z "$1" ]; then
  file=$(mktemp -u --suffix ".png")

  $capture_tool $file

  if [ ! -f $file ]; then
    exit 255
  fi

  process $file
  rm -f $file

else

  while [ $# -gt 0 ]; do
    file="$1"
    shift

    if [ ! -f "$file" ]; then
      echo "file '$file' doesn't exist" >&2
      continue
    fi

    process $file
  done
fi
