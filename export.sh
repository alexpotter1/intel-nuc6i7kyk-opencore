#!/bin/bash

unameOut="$(uname -s)"
platform=""
case "${unameOut}" in
    Darwin*) platform=Mac;;
    *)       platform="UNSUPPORTED:${unameOut}"
esac

echo "Attempting to mount EFI folder..."
read -p "Enter the disk identifier for EFI partition (e.g. disk0s1): " disk_id

esp_path=""
if [ "$platform" == "Mac" ]; then
    esp_path="/Volumes/ESP"
else
    echo "Unsupported platform! Use a Mac!"
    exit 1
fi

mkdir -p "${esp_path}"
mount -t msdos "/dev/${disk_id}" "${esp_path}"

rsync -avz --progress EFI "${esp_path}/"
