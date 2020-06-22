# PARS EchoLink
This EchoLink Node Configuration is based on the [article](http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158) by AP2CJ.

Before running, ensure you have [Docker](https://docs.docker.com/get-docker/) installed.

To test:

1. Build: `docker build . el`
2. Run: `docker run -it el`

TODO:

+ Forward audio to host via pulseaudio
+ Fix SvxLink errors for audio files not being found
