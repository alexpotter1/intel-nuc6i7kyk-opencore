#!/bin/bash

config_file=""

usage(){
    echo "INTEL NUC6I7KYK HACKINTOSH EFI OPENCORE SETUP"
    echo "----------------------"
    echo "Usage:"
    echo "-f | --file: I already have an OpenCore config file. Use this one (useful if you already have a valid SMBIOS registered with iCloud that you'd like to use)"
    echo "----------------------"
}

unameOut="$(uname -s)"
platform=""
case "${unameOut}" in
    Darwin*) platform=Mac;;
    *)       platform="UNSUPPORTED:${unameOut}"
esac

while [ "$1" != "" ]; do
    case $1 in
        -f | --file )   shift
                        config_file=$1
                        ;;
        -h | --help )   shift
                        usage
                        exit
                        ;;
        * )             usage
                        exit 1
    esac
    shift
done

echo "Building OpenCore configuration for Intel NUC6 Skull Canyon"
sleep 1
echo "Please build only on a Mac. Other systems are unsupported."
echo "Also ensure you have the latest Xcode installed from the App Store."
sleep 2

if [ "$platform" != "Mac" ]; then
    echo ""
    echo "It doesn't look like you're running macOS. Please use a Mac to use this script."
    echo "You can always build the configuration manually, also!"
    sleep 2
    exit 1
fi

if [ ! -z "$config_file" ]; then
    if [ ! -f $config_file ]; then
        echo "Config file not found!"
        exit 1
    else
        echo "Config file specified, copying"
        cp "$config_file" EFI/OC/
    fi
else
    echo "Config file not specified - updating default"
    if [ ! -d "./GenSMBIOS" ]; then
        echo "Downloading GenSMBIOS by CorpNewt"
        git clone https://github.com/corpnewt/GenSMBIOS
    fi
    
    echo "Follow the instructions given to create a new SMBIOS."
    echo "Important: For this system (NUC6i7KYK), choose iMac17,1 when asked."
    echo "Use the config file in this directory, as the script will handle copying to your ESP afterwards."
    sleep 3
    (cd GenSMBIOS; chmod +x GenSMBIOS.command; ./GenSMBIOS.command)
    sleep 3
fi

echo "Fetching required kexts..."
/bin/bash get-kexts.sh

echo "Building ACPI..."
/bin/bash build_acpi.sh

echo "Last step: Run export.sh to copy to your ESP (as sudo!)"
