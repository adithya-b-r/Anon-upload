#!/bin/bash

read -p "Enter the file name to upload : " f

file=$(pwd)/$f

if [[ -a ${file} ]]; then
res=$(curl -s -F "file=@$f" https://api.anonfiles.com/upload | jq '.')
else
echo "File $f is not found"
fi

echo "$res"

if [[ $(uname -o) == "Android" ]]; then
termux-clipboard-set "$res"
fi

xdg-open "$res"
