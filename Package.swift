// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PageContainer",
    platforms: [.macOS(.v11), .iOS(.v14)],
    products: [
        .library(
            name: "PageContainer",
            targets: ["PageContainer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PageContainer",
            dependencies: []),
        .testTarget(
            name: "PageContainerTests",
            dependencies: ["PageContainer"]),
    ]
)
