#!/bin/sh

typ="${RUNTIME_TYPE:-deno}"

img="min-wasi-helo-swift-${typ}"
ver=0.3.1
tag="${img}:${ver}"

test deno = "${typ}" &&
	exec docker \
		run \
		--read-only \
		--rm \
		--interactive \
		"${tag}"

docker \
	run \
	--rm \
	--interactive \
	"${tag}"
