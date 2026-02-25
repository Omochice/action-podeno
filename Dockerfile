# Container image that runs your code
FROM denoland/deno:latest@sha256:76702d3ee36524d8e8e4195798fc3263e42d860df9fb597230b8cfc48bcf2077

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
