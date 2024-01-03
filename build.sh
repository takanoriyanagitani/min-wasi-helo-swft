#!/bin/sh

BUILD_TYPE=${1:-debug}
typ=${BUILD_TYPE}
ncpus=${NUM_CPUS:-11}

build() {
	swift \
		build \
		--configuration "${typ}" \
		--triple wasm32-unknown-wasi \
		--jobs "${ncpus}"
}

build "${typ}"
