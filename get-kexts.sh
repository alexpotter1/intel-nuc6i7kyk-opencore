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

# IntelMausiEthernet.kext doesn't have a GitHub release, so manually build it
echo "Building IntelMausiEthernet from source..."
cd EFI/OC/Kexts && git clone https://github.com/Mieze/IntelMausiEthernet.git
cd IntelMausiEthernet
# not sure if user has Xcode CLI tools installed, try and install anyway
# not a problem if they already have it
xcode-select --install 2> /dev/null
xcodebuild -configuration Release
mv build/Release/IntelMausiEthernet.kext ../
cd ../
rm -rf IntelMausiEthernet

# Get UIA, no GitHub release
echo "Downloading USBInjectAll.kext..."
curl --silent -LOJ https://bitbucket.org/RehabMan/os-x-usb-inject-all/downloads/RehabMan-USBInjectAll-2018-1108.zip
find . -name "RehabMan-USBInjectAll*.zip" -type f -exec unzip -o "{}" "Release/USBInjectAll.kext/*" \;; find . -name "RehabMan-USBInjectAll*.zip" -type f -delete
mv Release/USBInjectAll.kext .
rm -r Release
echo "Finished building kexts!"
