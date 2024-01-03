// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "min-wasi-helo-swift",
  targets: [
    .executableTarget(
      name: "min-wasi-helo-swift",
      path: "Sources")
  ]
)
