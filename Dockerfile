FROM debian:buster
LABEL maintainer="Amin Shah Gilani <pars@gilani.me>" \
      description="PARS managed Echolink gateway run on Raspberry Pi"

# This file containerizes AP2CJ's tutorial
# http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158

# Install Dependencies
RUN apt-get update
RUN apt-get install -y wget bzip2 svxlink-server

# Install the English sounds for SvxLink
RUN cd /usr/share/svxlink/sounds/
RUN wget https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-13.12.tar.bz2
RUN tar xvjf svxlink-sounds-en_US-heather-16k-13.12.tar.bz2
RUN mv /en_US-heather-16k /usr/share/svxlink/sounds/en_US

# Copy configuration
COPY svxlink.conf /etc/svxlink/svxlink.conf

# Install pulseaudio
RUN apt-get install -y pulseaudio
ENV PULSE_SERVER=docker.for.mac.localhost

# Execute test
CMD svxlink
