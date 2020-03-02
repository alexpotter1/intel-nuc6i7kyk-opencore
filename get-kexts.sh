#!/bin/bash

echo "Updating required kexts..."

while IFS=$'\t' read -r -a kext_lines
do
    echo "Downloading ${kext_lines[0]}"
    url=$(curl -s https://api.github.com/repos/${kext_lines[1]}/${kext_lines[0]}/releases/latest | jq --raw-output '.assets[0] | .browser_download_url')
    echo "Fetching from $url"
    (cd EFI/OC/Kexts; curl --silent -LOJ $url)
    echo "Extracting ${kext_lines[0]}"
    if [[ "${kext_lines[0]}" = "VirtualSMC" ]]; then
        (cd EFI/OC/Kexts; find . -name "$(echo ${kext_lines[0]} | cut -c1-5)*.zip" -type f -exec unzip -o "{}" "Kexts/*SMC*.kext/*" \;; find . -name "$(echo ${kext_lines[0]} | cut -c1-5)*.zip" -type f -delete)
        (cd EFI/OC/Kexts; rsync -a Kexts/ .; rm -r Kexts)
    else
        (cd EFI/OC/Kexts; find . -name "$(echo ${kext_lines[0]} | cut -c1-5)*.zip" -type f -exec unzip -o "{}" "${kext_lines[0]}.kext/*" \;; find . -name "$(echo ${kext_lines[0]} | cut -c1-5)*.zip" -type f -delete)
    fi
done < kexts.txt
