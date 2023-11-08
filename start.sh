#!/bin/bash

# Check if Java OpenJDK 17 is installed
if [[ ! -d jdk-17 ]] || [[ -z $(ls -A jdk-17) ]]; then
    java_version=$(java -version 2>&1 | grep 'openjdk version' | awk '{print $3}' | tr -d '\"')
    if [[ $java_version != "17"* ]]; then
        echo "Java OpenJDK 17 is not installed, downloading..."
        # Download OpenJDK 17
        wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
        tar -xvf openjdk-17_linux-x64_bin.tar.gz
        rm openjdk-17_linux-x64_bin.tar.gz
        # Move the OpenJDK files to the 'jdk-17' directory
        mv jdk-17* jdk-17
        # Clear the console
        clear
    else
        echo "Java OpenJDK 17 is already installed."
    fi
fi

# Function to get the latest release URL
get_latest_release_url() {
    local release_url=$(curl -s https://api.github.com/repos/lavalink-devs/Lavalink/releases/latest | jq -r '.assets[] | select(.name == "Lavalink.jar") | .browser_download_url')
    echo "$release_url"
}

# Download and run Lavalink.jar
if [ ! -f Lavalink.jar ]; then
    echo "Lavalink.jar does not exist, downloading..."
    download_url=$(get_latest_release_url)
    if [ -n "$download_url" ]; then
        curl -L -o Lavalink.jar $download_url
    else
        echo "Lavalink.jar download URL not found."
    fi
else
    echo "Lavalink.jar already exists."
fi

# Check if Lavalink.jar was successfully downloaded
if [ -f Lavalink.jar ]; then
    echo "Running Lavalink.jar"
    ./jdk-17/bin/java -jar Lavalink.jar
else
    echo "Lavalink.jar download failed."
fi
