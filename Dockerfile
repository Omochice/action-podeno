# Container image that runs your code
FROM denoland/deno:latest@sha256:cbc04fb0d1d9b6d923a4cf7f13f7d08a74c89cf9da25af8e183a8153ad05eade

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
