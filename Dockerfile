FROM ghcr.io/swiftwasm/swift:5.8-jammy AS builder

WORKDIR /app
COPY ./Package.swift ./
COPY ./Sources/      ./Sources/

ARG NUM_CPUS=11
RUN swift \
	build \
	--configuration release \
	--triple wasm32-unknown-wasi \
	--jobs ${NUM_CPUS}
RUN cp ./.build/release/min-wasi-helo-swift.wasm /usr/local/bin/

FROM alpine:3.19.0 AS wasmer-builder
RUN apk update && apk upgrade --no-cache && apk add curl
RUN \
	adduser -D --home /home/wasmer wasmer && \
	addgroup wasmer wasmer
USER wasmer:wasmer
RUN touch /home/wasmer/.profile && curl -sSfL https://get.wasmer.io | sh

FROM debian:bookworm-slim
COPY --from=wasmer-builder /home/wasmer/.wasmer/bin/ /usr/local/bin/
COPY --from=builder        /usr/local/bin/           /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/wasmer"]
CMD ["run", "/usr/local/bin/min-wasi-helo-swift.wasm"]
