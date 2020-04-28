// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftKit",
    platforms: [
        .iOS(.v11),
        .tvOS(.v13)
        .watchOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftKit",
            targets: ["SwiftKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftKit",
            dependencies: []),
        .testTarget(
            name: "SwiftKitTests",
            dependencies: ["SwiftKit"]),
    ]
)
