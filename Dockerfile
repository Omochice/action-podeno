# Container image that runs your code
FROM denoland/deno:latest@sha256:4212a880f06e8dec28184688cce3449cc6e75232480e527342906b7c7ffc7b8d

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
