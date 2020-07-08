#!/bin/bash
###
### run.sh — This script readies and executes the PARS SvxLink node. You are
### Not expected to use this script directly. It should be executed via the
### ENTRYPOINT declarative in the Dockerfile.
###
### If $ENV is set to 'dev' then this script will make SvxLink call out its
### ID every 45 seconds by inputting *#
###
### Usage:
###   ./run.sh
###

# Checks if the required environment variables are set or raise a bad exit
[[ -z "$ECHOLINK_CALL" ]] && { echo "ECHOLINK_CALL is not set" ; exit 1; }
[[ -z "$ECHOLINK_PASS" ]] && { echo "ECHOLINK_PASS is not set" ; exit 1; }
[[ -z "$AUTH_KEY" ]] && { echo "AUTH_KEY is not set" ; exit 1; }


# Compile config from the ERB template files
erb /ModuleEchoLink.conf.erb > /etc/svxlink/svxlink.d/ModuleEchoLink.conf && \
    erb /svxlink.conf.erb > /etc/svxlink/svxlink.conf

# Set the appropriate audio levels
/usr/bin/amixer set 'Mic' 60%
/usr/bin/amixer set 'Speaker' 99%

# Default to PKT if no TIMEZONE env variable is set
echo "Setting time zone to ${TIMEZONE='Asia/Karachi'}"
echo "${TIMEZONE}" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Tell everyone you're ready
echo "PiLink ready!"

# if in development mode, read out ID continuously
if [[ $ENV == "dev" ]]; then
  echo "ENTERING DEVELOPMENT MODE"

  # Based off on the the code from Unix Stack Exchange: https://unix.stackexchange.com/a/272633/91046
  # make a unique pipe name
  PIPE=/tmp/svxlinkinput

  # Create the pipe
  mkfifo "$PIPE"
  # Start the SvxLink in the background
  svxlink <"$PIPE" &
  # Now grab an open handle to write the pipe
  exec 3>"$PIPE"
  # And we don't need to refer to the pipe by name anymore
  rm -f "$PIPE"

  # wait until SvxLink is (hopefully) ready
  sleep 5

  # Tell it to read out node information every 45 seconds
  while :; do
      echo '*' >&3
      echo '#' >&3
      sleep 45
  done
else # if not in development mode, just run svxlink normally
  svxlink
fi
