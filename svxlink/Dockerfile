# This file containerizes AP2CJ's tutorial
# http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158

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

# Remove remaining files
RUN rm svxlink-sounds-en_US-heather-16k-13.12.tar.bz2

# Install Ruby for templating and lsusb
RUN apt-get -y install ruby

# Copy config files
COPY scripts/compile_config.sh compile_config.sh
COPY config/ModuleEchoLink.conf.erb ModuleEchoLink.conf.erb
COPY config/svxlink.conf.erb svxlink.conf.erb

# Execute test
ENTRYPOINT ./compile_config.sh && svxlink svxlink
