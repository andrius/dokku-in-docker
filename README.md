# Dokku inside Docker

Original repository https://github.com/eugeneware/dokku-in-docker updated by Stefan Siegl: http://stesie.github.io/2015/11/dokku-on-docker.

Docker hub version: https://hub.docker.com/r/andrius/dokku-in-docker or

`docker pull andrius/dokku-in-docker:latest`

# Use it

Run with something like this:

```bash
docker run -d -t -i -e VHOSTNAME=example.org -e USERNAME=progrium -e PUBKEY='your ssh pubkey here' --privileged -p 22 -p 80 --name dokku lukas2511/dokku-in-docker
```

You can attach to the container to get a shell.
