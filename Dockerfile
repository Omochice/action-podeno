# Container image that runs your code
FROM denoland/deno:latest@sha256:acc18ab12bdb8505043a6c14553ae0a1b8211d6febc29db2aba8989ddbac8bad

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
