#!/bin/bash
# this script compiles configuration templates into working configs

# checks if the required environment variables are set or exit
[[ -z "$ARGO_HOST" ]] && { echo "ARGO_HOST is not set" ; exit 1; }
[[ -z "$ARGO_KEY" ]] && { echo "ARGO_KEY is not set" ; exit 1; }

echo $ARGO_KEY | base64 -D > /certs/${ARGO_HOST}.pem

echo "Successfully compiled config!"

/init
