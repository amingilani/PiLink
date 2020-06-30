FROM debian:buster
LABEL maintainer="Amin Shah Gilani <pars@gilani.me>" \
      description="PARS managed Echolink gateway run on Raspberry Pi"


# Install Dependencies including alsa utilities, Ruby for templating and lsusb
RUN apt-get update && apt-get install --yes wget bzip2 svxlink-server ruby alsa-utils usbutils

# Install the English sounds for SvxLink and cleanup
RUN wget https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-13.12.tar.bz2 --output-document=/usr/share/svxlink/sounds/sounds.tar.bz2 && \
    tar xvjf /usr/share/svxlink/sounds/sounds.tar.bz2 && \
    mv en_US-heather-16k /usr/share/svxlink/sounds/en_US && \
    rm /usr/share/svxlink/sounds/sounds.tar.bz2

# Copy config files
COPY scripts/run.sh run.sh
COPY config/ModuleEchoLink.conf.erb ModuleEchoLink.conf.erb
COPY config/svxlink.conf.erb svxlink.conf.erb

# Execute script
ENTRYPOINT ./run.sh
