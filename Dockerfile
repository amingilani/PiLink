FROM debian:buster
LABEL maintainer="Amin Shah Gilani <pars@gilani.me>" \
      description="PARS managed Echolink gateway run on Raspberry Pi"

# This file containerizes AP2CJ's tutorial
# http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158

# Add sources
#RUN echo 'deb http://mirrordirector.raspbian.org/raspbian/ buster main' | tee /etc/apt/sources.list.d/svxlink.list

# Install SvxLink
RUN apt-get update
RUN apt-get install -y svxlink-server wget bzip2



# Install the English sounds for SvxLink
RUN cd /usr/share/svxlink/sounds/
RUN wget https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-13.12.tar.bz2
RUN tar xvjf svxlink-sounds-en_US-heather-16k-13.12.tar.bz2
RUN ln -s en_US-heather-16k en_US

# Execute test

CMD /bin/bash
