# Container image that runs your code
FROM denoland/deno:latest@sha256:70b9c3ae21491073ca260e45b98f6dfc6ccc036e2af84c1831d21f675e1c0932

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
