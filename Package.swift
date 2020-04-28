// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SwiftKit",
    platforms: [
        .iOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6)
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
