const { default: { stream } } = require("got");
const { createWriteStream } = require("fs");
const { execSync } = require("child_process");

const url = "https://ci.fredboat.com/repository/download/Lavalink_Build/.lastSuccessful/Lavalink.jar?guest=1&branch=refs/heads/dev";

const start = () => {
    const download = stream(url).pipe(createWriteStream('Lavalink.jar'));
    download.on("finish", () => {
        // Use the local Java version
        execSync("java -jar Lavalink.jar", { stdio: "inherit" });
    });
};

start();
