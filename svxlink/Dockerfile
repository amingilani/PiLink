# This file containerizes AP2CJ's tutorial
# http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158

# Build the configuration from a template
FROM ruby
COPY ModuleEchoLink.conf.erb ModuleEchoLink.conf.erb
COPY svxlink.conf.erb svxlink.conf.erb
RUN erb /ModuleEchoLink.conf.erb > /ModuleEchoLink.conf
RUN erb /svxlink.conf.erb > /svxlink.conf

FROM debian:buster
LABEL maintainer="Amin Shah Gilani <pars@gilani.me>" \
      description="PARS managed Echolink gateway run on Raspberry Pi"


# Install Dependencies
RUN apt-get update
RUN apt-get install -y wget bzip2 svxlink-server

# Install the English sounds for SvxLink
RUN cd /usr/share/svxlink/sounds/
RUN wget https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-13.12.tar.bz2
RUN tar xvjf svxlink-sounds-en_US-heather-16k-13.12.tar.bz2
RUN mv /en_US-heather-16k /usr/share/svxlink/sounds/en_US

# Install pulseaudio
RUN apt-get install -y alsa-utils

# Copy configuration
COPY --from=0 /svxlink.conf /etc/svxlink/svxlink.conf
COPY --from=0 /ModuleEchoLink.conf /etc/svxlink/svxlink.d/ModuleEchoLink.conf

# Execute test
ENTRYPOINT svxlink
