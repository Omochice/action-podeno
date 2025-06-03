# Container image that runs your code
FROM denoland/deno:latest@sha256:225bee13f083e0304a2839d3c15b50020b0e82026d8a3665404d026b3367c737

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
