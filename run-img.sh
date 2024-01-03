#!/bin/sh

img=min-wasi-helo-swift
ver=0.2.5
tag="${img}:${ver}"

docker \
	run \
	--rm \
	--interactive \
	"${tag}"
