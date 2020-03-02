#!/bin/bash

unameOut="$(uname -s)"
platform=""
case "${unameOut}" in
    Linux*)  platform=Linux;;
    Darwin*) platform=Mac;;
    *)       platform="UNSUPPORTED:${unameOut}"
esac

echo "Attempting to mount EFI folder..."
read -p "Enter the disk identifier for EFI partition (e.g. disk0s1, sdb1, etc): " disk_id

esp_path=""
if [ "$platform" == "Linux" ]; then
    esp_path="/mnt/ESP"
elif [ "$platform" == "Mac" ]; then
    esp_path="/Volumes/ESP"
else
    echo "Unsupported platform! Use a Mac or Linux machine!"
    exit 1
fi

mkdir -p "${esp_path}"
mount -t msdos "/dev/${disk_id}" "${esp_path}"

rsync -avz --progress EFI "${esp_path}/"
