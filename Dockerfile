FROM alpine

RUN apk add --no-cache gcc git libc-dev linux-headers make && \
    git clone --depth 1 https://github.com/bacnet-stack/bacnet-stack && cd bacnet-stack && \
    make -ik

FROM alpine

COPY --from=0 /bacnet-stack/bin /bin
