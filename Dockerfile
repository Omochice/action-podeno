# Container image that runs your code
FROM denoland/deno:latest@sha256:3ea71953ff50e3ff15c377ead1a8521f624e2f43d27713675a8bed7b33f166aa

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mod.ts /mod.ts
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
