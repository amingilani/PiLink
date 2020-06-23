# PARS EchoLink
This EchoLink Node Configuration is based on the [article](http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158) by AP2CJ.

Before running, ensure you have [Docker](https://docs.docker.com/get-docker/) installed. This build is meant to be deployed to a balenaOS host, and depends on a host with `ALSA`.

## Testing

Prelude:

+ Ensure you have a local development version of balena running
+ Ensure the local host has a USB sound card attached

To test, push to the host with:

```
balena push $balena_dev_device
```


TODO:

+ Finish dev
+ Expose public ports
