#!/bin/bash

# Add the repository
echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu focal main" | tee /etc/apt/sources.list.d/linuxuprising-java.list

# Import the GPG key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A

# Update package lists
apt-get update

# Install Java 16
apt-get install -y oracle-java16-installer

# Verify the installation
java -version

echo "Running Lavalink.jar..."
java -jar Lavalink.jar
