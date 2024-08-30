<!-- markdownlint-disable MD045 -->

# Docker-Nscan

[![](https://images.microbadger.com/badges/version/waja/nscan.svg)](https://hub.docker.com/r/waja/nscan/)
[![](https://images.microbadger.com/badges/image/waja/nscan.svg)](https://hub.docker.com/r/waja/nscan/)
[![Build Status](https://travis-ci.org/Cyconet/docker-nscan.svg?branch=development)](https://travis-ci.org/Cyconet/docker-nscan)
[![Docker Build Status](https://img.shields.io/docker/build/waja/nscan.svg)](https://hub.docker.com/r/waja/nscan/)
[![GitHub tag](https://img.shields.io/github/tag/Cyconet/docker-nscan.svg)](https://github.com/Cyconet/docker-nscan/tags)
[![](https://img.shields.io/docker/pulls/waja/nscan.svg)](https://hub.docker.com/r/waja/nscan/)
[![](https://img.shields.io/docker/stars/waja/nscan.svg)](https://hub.docker.com/r/waja/nscan/)
[![](https://img.shields.io/docker/automated/waja/nscan.svg)](https://hub.docker.com/r/waja/nscan/)

Builds a docker image with the [nscan](https://github.com/OffensivePython/Nscan) ready to run.

# Running

- run the docker container with:

```bash
docker run --rm --net=host waja/nscan -h
```

We don't actually _require_ `--net=host`, but if we're wanting to test native performance (or use `--source some-specific-host-IP`) then we want direct access to the relevant connections without any overhead.

# Building

```bash
make build
```

# Get a shell in a running container

```bash
make shell
```
