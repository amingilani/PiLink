# PiLink

**WIP DO NOT USE**

![BalenaCloud Push](https://github.com/amingilani/pars-echolink/workflows/BalenaCloud%20Push/badge.svg)

This EchoLink Node Configuration is based on the [article](http://www.pakhams.com/index.php?option=com_content&view=article&id=178:pi3echolink&catid=45:misc&Itemid=158) by AP2CJ.

Before running, ensure you have [Docker](https://docs.docker.com/get-docker/) installed. This build is meant to be deployed to a balenaOS host, and depends on a host with `ALSA`.


## Services:

`svxlink` is the echolink service, it requires the following to operate:

- `ECHOLINK_CALL`: Echolink callsign
- `ECHOLINK_PASS`: Echolink password
- `DEVICE_CALL`: The call sign assigned to this device
- `AUTH_KEY`: The auth key for the device

`tunnel` is forwards ports out via CloudFlare's Argo. It requires

- `ARGO_HOST`: Argo host
- `ARGO_KEY`: Argo certificate in base64 generated use `cat cert.pem | base64`
- `TUNNEL_URL`: The `svxlink` URL you want to forward


## Testing

Note that during testing you cannot run Balena Cloud environment variables. Pass them through docker compose or your Dockerfile.

Prelude:

+ Ensure you have a local development version of balena running
+ Ensure the local host has a USB sound card attached

To test, push to the host with:

```
balena push $balena_dev_device
```


TODO:

+ Fix environment variables in intermediate container
+ deploy via balena cloud
+ Finish dev
+ Expose public ports
