#!/bin/sh

wasm=./.build/release/min-wasi-helo-swift.wasm

test -f "${wasm}" || exec sh -c 'echo build first; exit 1'

which wasmer   && wasmer   run "${wasm}"
which wasmtime && wasmtime run "${wasm}"
