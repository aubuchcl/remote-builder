# Use buildkit as the base image
FROM moby/buildkit:latest

# Install dependencies
RUN apk update && apk add --no-cache curl git bash glab


# Copy the entry script into the image
COPY entrypoint.sh /entrypoint.sh

# Ensure the script is executable
RUN chmod +x /entrypoint.sh

# Set the entry script as the default command
ENTRYPOINT ["/entrypoint.sh"]
