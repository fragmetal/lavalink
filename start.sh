#!/bin/bash
# Check if Java OpenJDK 17 is installed
if [[ ! -d jdk-17 ]] || [[ -z $(ls -A jdk-17) ]]; then
    echo "Java OpenJDK 17 is not installed, downloading..."
    # Download OpenJDK 17
    curl -O https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
    tar -xvf openjdk-17_linux-x64_bin.tar.gz
    rm openjdk-17_linux-x64_bin.tar.gz
    # Move the OpenJDK files to the 'jdk-17' directory
    mv jdk-17* jdk-17
    # Clear the console
    clear
fi

# Direct URL of the latest release
download_url="https://github.com/lavalink-devs/Lavalink/releases/download/3.7.9/Lavalink.jar"

# Download and run Lavalink.jar
if [ ! -f Lavalink.jar ]; then
    echo "Lavalink.jar does not exist, downloading..."
    curl -L -o Lavalink.jar $download_url
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
