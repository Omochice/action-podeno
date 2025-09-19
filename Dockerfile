# Container image that runs your code
FROM denoland/deno:latest@sha256:f8d11eff1d419044bd7141396e56bb4e8989c86a11689e3212a6f4445534f98b

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
