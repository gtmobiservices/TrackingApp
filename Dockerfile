# Use an official openjdk runtime as a parent image
FROM openjdk:11-jdk-slim

# Set the working directory to /app
WORKDIR /app

# Copy schema directory to the container
COPY schema schema

# Copy templates directory to the container
COPY templates templates

# Copy all files of target directory to the container
COPY target/ .

# Copy default.xml from setup directory to the container
COPY setup/default.xml .

# Create log directory in the container
RUN mkdir logs && touch logs/tracker-server.log

# Define the command to run when the container starts
ENTRYPOINT ["java","-jar","/app/tracker-server.jar","/app/default.xml"]
