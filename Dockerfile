# Container image that runs your code
FROM denoland/deno:latest@sha256:467d41805c2f531a48f84dfcd1b4f9244b8ebdbd505f752011d6d1b7daacc489

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
