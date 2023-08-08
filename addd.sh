#!/bin/bash

# 4ndyMcFly 2023
# https://github.com/4ndymcfly

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
    echo -e"\n[i] This script must be run as root" 1>&2
    exit 1
fi

# Check if the --clean parameter has been provided
if [ "$1" == "--clean" ] || [ "$1" == "-c" ]; then
    # Delete all lines below # Others in the /etc/hosts file
    sed -i '/^# Others/,$d' /etc/hosts
    echo "# Others" | sudo tee -a /etc/hosts > /dev/null

    echo -e "\n [+] All lines below # Others have been deleted from the /etc/hosts file.\n"
else
    if [ $# -ne 2 ]; then
        echo -e "\n[+] Usage:\t $0 [IP] [domain name]"
        echo -e "\t\t $0 [--clean] or [-c] delete all lines below '# Others' in /etc/hosts\n"
        exit 1
    fi

    IP=$1
    DOMAIN=$2

    # Check if the /etc/hosts file exists and, if so, create a copy with the .old extension
    if [ -e /etc/hosts ]; then
        if [ ! -e /etc/hosts.old ]; then
            cp /etc/hosts /etc/hosts.old
        fi
    fi

    # Check if an entry with the same domain name already exists in the /etc/hosts file
    if grep -qw "$DOMAIN" /etc/hosts; then
        echo -e "\n[!] '$DOMAIN' already exists in the /etc/hosts file!\n"
        exit 1
    
    elif grep -q "^$IP" /etc/hosts; then
        # Add the domain name to the same line as the existing entry
        sed -i "/^$IP/ s/$/ $DOMAIN/" /etc/hosts
        echo -e "\n[+] '$DOMAIN' has been successfully added to the existing entry with IP $IP in the /etc/hosts file\n"
    
    else
        # Add the entry to the /etc/hosts file if no entry with the same domain name or IP exists
        echo "$IP $DOMAIN" | sudo tee -a /etc/hosts > /dev/null
        echo -e "\n[+] '$IP $DOMAIN' has been added to the /etc/hosts file\n"
    fi 
fi 
