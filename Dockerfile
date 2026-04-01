# Container image that runs your code
FROM denoland/deno:latest@sha256:869e31370dca82b10abefeabe92a2efae44c0d8c70e03776b05ca07ce6b2e062

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
