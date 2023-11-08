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
# GitHub repo URL
repo_url="https://api.github.com/repos/lavalink-devs/Lavalink/releases/latest"

# Get the URL of the latest release from the GitHub API
get_latest_release_url() {
    # Fetch the API response
    api_response=$(curl --silent "$repo_url")
    
    # Extract and print the download URL
    download_url=$(echo "$api_response" | grep -Po '"browser_download_url": "\K.*?(?=")')
    
    # Return the download URL
    echo "$download_url"
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
