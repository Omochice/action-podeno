# Container image that runs your code
FROM denoland/deno:latest@sha256:0487a6a8ee181078b777349988d38d92cd21cb9d66dc0d8f3b6db223db6700b4

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
