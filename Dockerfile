FROM alpine:3.6
                                                                                
# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

RUN apk --no-cache add python && \
 apk --no-cache add --virtual build-dependencies git && \
 git clone https://github.com/OffensivePython/Nscan /usr/local/nscan && \
 chmod +x /usr/local/nscan/latest/nscan.py && \
 ln -s /usr/local/nscan/latest/nscan.py /usr/local/bin/nscan && \
 apk del build-dependencies

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/bin/nscan"]
