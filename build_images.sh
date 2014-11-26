#!/usr/bin/env bash

# Build gdrive_image and cred_image images:

# Abort on failure:
set -e

docker build -t gdrive_core_image ./core_image
docker build -t gdrive_cred_image ./cred_image

# Unset abort on failure:
set +e
