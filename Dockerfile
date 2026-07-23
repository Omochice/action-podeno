# Container image that runs your code
FROM denoland/deno:latest@sha256:c777b4b225501a61074837e90a826a58f99124837824023cd60334b1e2374498

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
