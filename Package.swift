// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "OKCipherLib",
    products: [
        .library(
            name: "OKCipherLib",
            targets: ["OKCipherLib"]
        ),
    ],
    targets: [
        .target(
            name: "OKCipherLib"
        ),
        .testTarget(
            name: "OKCipherLibTests",
            dependencies: ["OKCipherLib"]
        ),
    ]
)
