# syntax = docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
# requires DOCKER_BUILDKIT=1 set when running docker build
# checkov:skip=CKV_DOCKER_2: no healthcheck (yet)
# checkov:skip=CKV_DOCKER_3: no user (yet)
FROM alpine:3.15.11@sha256:19b4bcc4f60e99dd5ebdca0cbce22c503bbcff197549d7e19dab4f22254dc864
                                                                                
ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_URL
ARG VCS_REF
ARG VCS_BRANCH

# See http://label-schema.org/rc1/ and https://microbadger.com/labels
LABEL maintainer="Jan Wagner <waja@cyconet.org>" \
    org.label-schema.name="nscan - fast internet-wide scanner" \
    org.label-schema.description="Fast Network scanner optimized for internet-wide scanning purposes on Alpine Linux based container" \
    org.label-schema.vendor="Cyconet" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE:-unknown}" \
    org.label-schema.version="${BUILD_VERSION:-unknown}" \
    org.label-schema.vcs-url="${VCS_URL:-unknown}" \
    org.label-schema.vcs-ref="${VCS_REF:-unknown}" \
    org.label-schema.vcs-branch="${VCS_BRANCH:-unknown}" \
    org.opencontainers.image.source="https://github.com/waja/docker-nscan"

# hadolint ignore=DL3017,DL3018
RUN apk --no-cache update && apk --no-cache upgrade && \
 apk --no-cache add python2 && \
 apk --no-cache add --virtual build-dependencies curl tar && \
 mkdir -p /usr/local/nscan 
WORKDIR  /usr/local/nscan
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN curl -L https://github.com/OffensivePython/Nscan/archive/master.tar.gz | tar xz --strip=1 && \
 chmod +x /usr/local/nscan/latest/nscan.py && \
 ln -s /usr/local/nscan/latest/nscan.py /usr/local/bin/nscan && \
 apk del build-dependencies

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/bin/nscan"]
