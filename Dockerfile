# Container image that runs your code
FROM denoland/deno:latest@sha256:c40ad61ed0b40cca8fda05a2bbf44f8e02485bebec8ee4820bdb4b6fff42599d

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
