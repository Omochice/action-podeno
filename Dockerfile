# Container image that runs your code
FROM denoland/deno:latest@sha256:075c8d994cf1e44f10d98ea86f6693037e9c66eb83e9b5fa6a534147372de3fb

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
