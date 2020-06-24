#!/bin/bash
# this script compiles configuration templates into working configs

# checks if the required environment variables are set or exit
[[ -z "$ECHOLINK_CALL" ]] && { echo "ECHOLINK_CALL is not set" ; exit 1; }
[[ -z "$ECHOLINK_PASS" ]] && { echo "ECHOLINK_PASS is not set" ; exit 1; }
[[ -z "$DEVICE_CALL" ]] && { echo "DEVICE_CALL is not set" ; exit 1; }
[[ -z "$AUTH_KEY" ]] && { echo "AUTH_KEY is not set" ; exit 1; }

# compile config
erb /ModuleEchoLink.conf.erb > /etc/svxlink/svxlink.d/ModuleEchoLink.conf && \
    erb /svxlink.conf.erb > /etc/svxlink/svxlink.conf

echo "Successfully compiled config!"
