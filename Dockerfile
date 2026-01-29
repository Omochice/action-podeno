# Container image that runs your code
FROM denoland/deno:latest@sha256:293e593b7c43c33f6cc693142da3c549f40bd527aabcdd2dd48e5222e071b04d

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
