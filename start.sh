LATEST_VERSION=$(curl -s https://api.github.com/repos/Cog-Creators/Lavalink-Jars/releases/latest | grep 'tag_name' | cut -d\" -f4)
echo Downloading Lavalink.jar version $LATEST_VERSION...
curl -LJO "https://github.com/Cog-Creators/Lavalink-Jars/releases/download/$LATEST_VERSION/Lavalink.jar"
echo Lavalink.jar is downloaded...
clear
echo Starting Lavalink...
java -jar Lavalink.jar &
clear

# Wait for Lavalink to be ready
while true; do
    response=$(curl -s -o /dev/null -w "%{http_code}" https://lavalink.fragmetal88.repl.co/metrics)
    if [ "$response" = "200" ]; then
        break
    fi
    sleep 5
done

echo "Lavalink is ready. Starting loop..."

while true; do
    response=$(curl -s -o /dev/null -w "%{http_code}" https://lavalink.fragmetal88.repl.co/metrics)
    sleep 5
done
