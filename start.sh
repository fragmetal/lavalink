# Check if Java OpenJDK 17 is installed
java_version=$(java -version 2>&1 | grep 'openjdk version' | awk '{print $3}' | tr -d '\"')
if [[ $java_version != "17"* ]]; then
    echo "Java OpenJDK 17 is not installed, downloading..."
    # Download OpenJDK 17
    wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
    echo "Create /usr/lib/jvm/ directory if it doesn't exist"
    sudo mkdir -p /usr/lib/jvm/
    echo "Extract the tar.gz file into /usr/lib/jvm/"
    sudo tar -xvf openjdk-17_linux-x64_bin.tar.gz -C /usr/lib/jvm/
    echo "Delete the tar.gz file"
    clear
    rm openjdk-17_linux-x64_bin.tar.gz
    sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-17/bin/java 1
    sudo update-alternatives --set java /usr/lib/jvm/jdk-17/bin/java
else
    echo "Java OpenJDK 17 is already installed."
fi

# Print the version of Java being used
java -version

# Download and run Lavalink.jar
if [ ! -f Lavalink.jar ]; then
    echo "Lavalink.jar does not exist, downloading..."
    download_url=$(curl -s https://api.github.com/repos/lavalink-devs/Lavalink/releases/latest | grep 'browser_' | cut -d\" -f4)
    curl -L $download_url -o Lavalink.jar
else
    echo "Lavalink.jar already exists."
fi

echo "Running Lavalink.jar"
screen -S lavalink -dm bash -c 'java -jar Lavalink.jar'
