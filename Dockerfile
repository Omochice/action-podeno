# Container image that runs your code
FROM denoland/deno:latest@sha256:4a10a8523dcbfdd36e5261e7103f7ce79c270615979b58d5867caeb434fbc571

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
