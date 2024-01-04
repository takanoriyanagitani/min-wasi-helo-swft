import Context from "https://deno.land/std@0.93.0/wasi/snapshot_preview1.ts";

const context = new Context({});

const wasmBytes = await Deno.readFile(
  "./min-wasi-helo-swift.wasm",
);

const module = await WebAssembly.compile(wasmBytes);

const instance = await WebAssembly.instantiate(
  module,
  {
    wasi_snapshot_preview1: context.exports,
  },
);

context.start(instance);
