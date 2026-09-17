# Container image that runs your code
FROM denoland/deno:latest@sha256:fa335acdf6b72106eda2cb6a8cb5f4187e7630e357467489db4b2e7352d5e432

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
