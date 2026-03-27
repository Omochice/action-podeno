# Container image that runs your code
FROM denoland/deno:latest@sha256:8c18486c1c2b6582cf6e17e0a6c21c4d741224f3ec6298389bfb473b8cf8d73f

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
