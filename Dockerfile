# Container image that runs your code
FROM denoland/deno:latest@sha256:955798026c6ab497f99111345b25cd47857ef366bf70eed3614deba66bd86d1a

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
