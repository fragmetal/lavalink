if [ ! -f Lavalink.jar ]; then
    echo "Lavalink.jar does not exist, downloading..."
    download_url=$(curl -s https://api.github.com/repos/lavalink-devs/Lavalink/releases/latest | grep 'browser_' | cut -d\" -f4)
    curl -L $download_url -o Lavalink.jar
else
    echo "Lavalink.jar already exists."
fi
echo "Running Lavalink.jar..."
java -jar Lavalink.jar