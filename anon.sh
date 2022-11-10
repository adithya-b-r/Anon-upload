#!/bin/bash

read -p $'\e[33mEnter the file name to upload \e[31m:\e[0m ' f

file=$(pwd)/$f

if [[ -a ${file} ]]; then
res=$(curl -s -F "file=@$f" https://api.anonfiles.com/upload | jq .data.file.url.short) >/dev/null 2>&1
else
echo "File $f is not found"
fi

res=$(echo $res | tr -d '"')

if [[ $(uname -o) == "Android" ]]; then
termux-clipboard-set "$res"
xdg-open "$res"
else
echo -e "\e[94mLink \e[31m: \e[32m$res\e[0m"
fi
