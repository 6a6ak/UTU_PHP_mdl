#!/bin/bash

while true
do
    echo "                 PHP Module tools                 "
    echo "________________________________________________"
    echo "1. Show PHP INI file info"
    echo "2. Check if PHP extension is installed"
    echo "3. Open PHP INI file"
    echo "4. Restart Apache"
    echo "0. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1)
        php --ini
        ;;
    2)
        read -p "Enter the PHP extension you want to check: " extension
        if php -m | grep -q $extension; then
            echo "$extension is installed."
        else
            echo "$extension is not installed."
        fi
        ;;
    3)
        ini_path=$(php --ini | grep "Loaded Configuration File" | cut -d" " -f12)
        sudo nano $ini_path
        ;;
    4)
        sudo systemctl restart apache2
        ;;
    0)
        echo "Exiting."
        break
        ;;
    *)
        echo "Invalid choice."
        ;;
    esac
done
