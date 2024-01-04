#!/bin/sh

typ="${RUNTIME_TYPE:-wasmer}"

img="min-wasi-helo-swift-${typ}"
ver=0.3.1
tag="${img}:${ver}"

dfl="./Dockerfile.${typ}"

build() {
	docker \
		buildx \
		build \
		--progress plain \
		--tag "${tag}" \
		--file "${dfl}" \
		.
}

images() {
	docker images "${tag}" | fgrep "${img}" | fgrep --silent "${ver}"
}

images || build
