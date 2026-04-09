# Container image that runs your code
FROM denoland/deno:latest@sha256:9c47e8b8fa41e91fe2dd1448888244a56c4ec90124333d5341319b043a3a6ca0

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
