# Download and extract OpenJDK 17
if [ ! -d "jdk-17" ]; then
    echo "OpenJDK 17 does not exist, downloading..."
    wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
    tar xvf openjdk-17_linux-x64_bin.tar.gz
else
    echo "OpenJDK 17 already exists."
fi

# Set JAVA_HOME to the extracted OpenJDK 17 directory
export JAVA_HOME=$PWD/jdk-17
export PATH=$JAVA_HOME/bin:$PATH

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

echo "Running Lavalink.jar with OpenJDK 17..."
java -jar Lavalink.jar
