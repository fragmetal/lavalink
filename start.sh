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
        # Clear the console
        clear
    else
        echo "Java OpenJDK 17 is already installed."
    fi
fi
# Print the version of Java being used
./jdk-17/bin/java -version
# Download and run Lavalink.jar
if [ ! -f Lavalink.jar ]; then
    echo "Lavalink.jar does not exist, downloading..."
    download_url=$(curl -s https://api.github.com/repos/lavalink-devs/Lavalink/releases/latest | grep 'browser_' | cut -d\" -f4)
    curl -L $download_url -o Lavalink.jar
else
    echo "Lavalink.jar already exists."
fi
echo "Running Lavalink.jar"
./jdk-17/bin/java -jar Lavalink.jar
# Run the Flask server
# ./Python-3.10.10/_install/bin/python3 flaskme.py
