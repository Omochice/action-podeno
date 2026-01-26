# Container image that runs your code
FROM denoland/deno:latest@sha256:08941c4fcc2f0448d34ca2452edeb5bca009bed29313079cfad0e5e2fa37710f

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
