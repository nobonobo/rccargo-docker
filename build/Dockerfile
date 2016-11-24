FROM alpine:3.3

RUN apk update && apk add -t buildtools go git automake autoconf gcc g++ libtool make
RUN curl -L https://bitbucket.org/odedevs/ode/get/tip.tar.gz | tar xz && cd odedevs-ode-* && ./bootstrap && ./configure --prefix=/usr --enable-libccd --enable-double-precision --enable-shared && make && make install
RUN mkdir -p /go
ENV GOPATH=/go
RUN git clone https://github.com/nobonobo/ode /go/src/github.com/ianremmler/ode
RUN git clone https://github.com/nobonobo/rccargo.git /go/src/github.com/nobonobo/rccargo
#RUN git -C /go/src/github.com/nobonobo/rccargo checkout --track origin/feature/WIP
RUN go get github.com/nobonobo/rccargo
RUN cp /go/src/github.com/nobonobo/rccargo/profile.json /go/bin/
RUN cp -R /go/src/github.com/nobonobo/rccargo/assets /go/bin/
