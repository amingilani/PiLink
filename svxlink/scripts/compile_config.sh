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

if [[ $ENV == "dev" ]]; then
  echo "ENTERING DEVELOPMENT MODE"

  # based off of the the code from unix Stack Exchange: https://unix.stackexchange.com/a/272633/91046
  # make a unique pipe name
  PIPE=/tmp/svxlinkinput

  # Create the pipe
  mkfifo "$PIPE"
  # Start the Python program in the background
  svxlink <"$PIPE" &
  # Now grab an open handle to write the pipe
  exec 3>"$PIPE"
  # And we don't need to refer to the pipe by name anymore
  rm -f "$PIPE"

  # wait until svxlink is (hopefully) ready
  sleep 5

  # Tell it to read out node information every 45 seconds
  while :; do
      echo '*' >&3
      echo '#' >&3
      sleep 45
  done
else
  svxlink
fi
