# Container image that runs your code
FROM denoland/deno:latest@sha256:f35fb70a590a2004fb3a3f7229c56e9026b522753851ccbefc3c1cf2f58c2153

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
