FROM alpine

RUN apk add --no-cache gcc git libc-dev linux-headers make && \
    git clone --depth 1 https://git.code.sf.net/p/bacnet/src && cd src && \
    make -ik

FROM alpine

COPY --from=0 /src/bin /bin
