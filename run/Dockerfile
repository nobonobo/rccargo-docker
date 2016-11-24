FROM alpine:3.3

RUN apk update && apk add libgcc libgc++
ADD ./rccargo /rccargo
ENV LD_LIBRARY_PATH=/rccargo
WORKDIR /rccargo
EXPOSE 8080
ENTRYPOINT ./rccargo
