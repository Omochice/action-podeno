# Container image that runs your code
FROM denoland/deno:latest@sha256:8aca3eca04f134eca52a50bf3004072995d7a292e4962660d298cbee144d31f2

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
