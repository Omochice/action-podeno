# Container image that runs your code
FROM denoland/deno:latest@sha256:21385aa712aa2abce8f60d5c9446dd8c26102df439eaf9de2108846103ee42c4

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
