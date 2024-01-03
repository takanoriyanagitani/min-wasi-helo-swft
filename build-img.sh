#!/bin/sh

img=min-wasi-helo-swift
ver=0.2.5
tag="${img}:${ver}"

build(){
	docker \
		buildx \
		build \
		--progress plain \
		--tag "${tag}" \
		--file ./Dockerfile \
		.
}

images(){
  docker images "${tag}" | fgrep "${img}" | fgrep --silent "${ver}"
}

images || build
