FROM golang:1.17

WORKDIR /

RUN git clone https://github.com/mprencipe/waggers.git &&\
    cd waggers && \
    go get && \
    go build

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
