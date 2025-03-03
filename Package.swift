// swift-tools-version: 5.7.1

import PackageDescription

let package = Package(
    name: "NetworkService",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NetworkService",
            targets: ["NetworkService"]
        ),
    ],
    targets: [
        .target(
            name: "NetworkService"
        ),
    ]
)
