# Container image that runs your code
FROM denoland/deno:latest@sha256:17c3312d47b525b71830527e7b54cd543bc16de6546982b760b0de4de957d463

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
