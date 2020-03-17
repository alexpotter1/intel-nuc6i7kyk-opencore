#!/bin/bash

echo "Downloading Intel ACPI compiler..."
curl https://bitbucket.org/RehabMan/acpica/downloads/iasl61.zip -L -o iasl.zip
unzip iasl.zip

cd EFI/OC/ACPI
echo "Compiling ACPI DSL files..."
sleep 1
../../../iasl -vw 2095 -vw 2008 *.dsl

echo "Done!"
