# Container image that runs your code
FROM denoland/deno:latest@sha256:a5c9bbca7fe855a35a8656b7ce0ee7ff0084154d7c5cdc5005a89dc882a88b63

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
