# Container image that runs your code
FROM denoland/deno:latest@sha256:3373fa94f2a9295041f35ec617d13ef5a84eec944235729ec10b5c167a891688

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
