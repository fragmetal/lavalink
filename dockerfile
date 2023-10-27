# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Install curl
RUN apt-get update && apt-get install -y curl

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Run main.sh when the container launches
CMD ["java -jar Lavalink.jar"]
