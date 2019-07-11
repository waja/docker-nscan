FROM alpine:3.10
                                                                                
# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_URL
ARG VCS_REF
ARG VCS_BRANCH

# See http://label-schema.org/rc1/ and https://microbadger.com/labels
LABEL org.label-schema.name="nscan - fast internet-wide scanner" \
    org.label-schema.description="Fast Network scanner optimized for internet-wide scanning purposes on Alpine Linux based container" \
    org.label-schema.vendor="Cyconet" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date="${BUILD_DATE:-unknown}" \
    org.label-schema.version="${BUILD_VERSION:-unknown}" \
    org.label-schema.vcs-url="${VCS_URL:-unknown}" \
    org.label-schema.vcs-ref="${VCS_REF:-unknown}" \
    org.label-schema.vcs-branch="${VCS_BRANCH:-unknown}"

RUN apk --no-cache update && apk --no-cache upgrade && \
 apk --no-cache add python && \
 apk --no-cache add --virtual build-dependencies curl tar && \
 mkdir -p /usr/local/nscan && cd /usr/local/nscan && \
 curl -L https://github.com/OffensivePython/Nscan/archive/master.tar.gz | tar xz --strip=1 && \
 chmod +x /usr/local/nscan/latest/nscan.py && \
 ln -s /usr/local/nscan/latest/nscan.py /usr/local/bin/nscan && \
 apk del build-dependencies

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/bin/nscan"]
