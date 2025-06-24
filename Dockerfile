# Container image that runs your code
FROM denoland/deno:latest@sha256:ed3ef87b36da0b7c23b4f1c29e766117a3a893aeaa8310135da6ce6b8efba06e

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
