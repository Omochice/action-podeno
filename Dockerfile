# Container image that runs your code
FROM denoland/deno:latest@sha256:1d1c1799f0bc5c63b61f54e07fbfe78a9fc364cb93437437464a0e5dd0769771

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
