# Container image that runs your code
FROM denoland/deno:latest@sha256:d0f3854232ab56efe1ed8af32a6042fce67f75027c4f473e7543ae15a19d0fd6

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
