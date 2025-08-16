# Container image that runs your code
FROM denoland/deno:latest@sha256:07b28fd0c7c1d0e78113242dde185769cef4574fe19f6fdeb06c10f889f6d9a7

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
