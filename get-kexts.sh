#!/bin/bash

join () {
    local IFS="$1"
    shift
    echo "$*"
}

xcode-select --install

wifi_enabled=0
lilu_friends=()
github=()
echo ""
read -p 'Do you want to enable Intel WiFi support? (experimental) [y/N]: ' wifi_input

# lowercase
wifi_input=$(echo "$wifi_input" | tr '[:upper:]' '[:lower:]')
if [[ $wifi_input == 'y' ]]; then
    echo 'Enabled Intel WiFi support'
    echo 'This kext is not considered production-ready yet. Use at own risk.'
    echo ""
    wifi_enabled=1
    sleep 1
fi

if [[ $wifi_enabled -eq 1 ]]; then
    # remove newline, add new info and re-append newline
    perl -pi -e 'chomp if eof' kexts.txt
    echo -e "\nOpenIntelWireless-Factory	1hbb	0" >> kexts.txt
fi

itlwm_enabled_already=$(/usr/libexec/PlistBuddy -c "Print :Kernel:Add:9:Enabled" EFI/OC/config.plist)
if [ "$wifi_enabled" -eq 0 ] && [[ "$itlwm_enabled_already" == "true" ]]; then
    echo "Resetting itlwm enabled state in config.plist"
    /usr/libexec/PlistBuddy -c "Set :Kernel:Add:9:Enabled false" EFI/OC/config.plist
fi

while IFS=$'\t' read -r -a kext_lines
do
    if [[ ${kext_lines[2]} -eq 1 ]]
    then
        lilu_friends+=( ${kext_lines[0]} )
    else
        github+=( ${kext_lines[0]} ${kext_lines[1]} )
    fi
done < kexts.txt

if [ ! -d lilu-and-friends ]; then
    git clone https://github.com/corpnewt/lilu-and-friends
fi

echo ""
echo "Using Lilu-and-Friends by CorpNewt to build kexts"
echo "Available at: https://github.com/corpnewt/lilu-and-friends"
echo ""
cd lilu-and-friends
kext_list=$(join , "${lilu_friends[@]}")

sleep 2
chmod +x ./Run.command
./Run.command -rk ${kext_list[*]}

echo ""
echo "Some kexts weren't available to build from source."
echo "Attempting to find their GitHub release"
echo ""
sleep 2

if [ -f errors.txt ]; then
    rm errors.txt
fi

echo "Fetching jq"
echo ""
curl -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64 --output jq
chmod +x ./jq || echo "ERROR: jq" >> errors.txt

for ((i=0; i<${#github[@]}; i++))
do
    echo "Downloading ${github[$i]}"
    url=$(curl -L https://api.github.com/repos/${github[$i+1]}/${github[$i]}/releases | ./jq --raw-output '.[0].assets[0] | .browser_download_url')
    echo "Fetching from $url"
    (( i++ ))
    (cd Kexts; curl --silent -LOJ $url)
done

echo ""
echo "Extracting and moving kexts"
cd Kexts
find . -name "*.zip" -exec unzip {} \;
find . -name "IntelBluetoothInjector.kext" -type d -exec rm -r {} +
find . -name "XHCI-unsupported.kext" -type d -exec rm -r {} +
if [[ $wifi_enabled -eq 1 ]]; then
    find . -name "itlwmx.kext" -type d -exec rm -r {} +
fi

find . -name "*.kext" -exec cp -r {} ../../EFI/OC/Kexts/ \;

if [[ $wifi_enabled -eq 1 ]]; then
    find . -name "HeliPort.app" -exec cp -r {} ../../EFI/OC/ \;
    echo ""
    echo "The Intel WiFi driver (itlwm.kext) has been moved to EFI/OC/Kexts."
    sleep 2
    echo "The controlling app, HeliPort, has been moved to EFI/OC."
    sleep 2
    echo "After installation, mount your EFI and copy the HeliPort app to /Applications."
    sleep 2
    echo "From there, it will provide control for connecting to wireless networks."
    sleep 2
    echo "You can also tell it to launch at login."
    sleep 2
    echo "For more help, go to https://github.com/OpenIntelWireless."
    sleep 2
    echo ""

    echo "Patching config.plist"
    /usr/libexec/PlistBuddy -c "Set :Kernel:Add:9:Enabled true" ../../EFI/OC/config.plist
    sed -i '' -e '$ d' ../../kexts.txt
fi

if [ -f ../errors.txt ]; then
    echo ""
    echo "ERROR ENCOUNTERED DURING BUILD"
    sleep 2
    echo "Errors were encountered downloading additional kexts."
    sleep 2
    echo "This will result in the NUC not being able to boot correctly."
    sleep 2
    echo "Please try again, or if it persists, consider raising an issue on the GitHub page."
    echo ""
    echo "BUILD FAILED"
fi

cd ../../
echo ""
echo "Cleaning up"
rm -rf lilu-and-friends