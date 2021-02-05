// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftKit",
    platforms: [
        .iOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "SwiftKit",
            targets: ["SwiftKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/danielsaidi/MockingKit.git", .upToNextMajor(from: "0.9.0"))
    ],
    targets: [
        .target(
            name: "SwiftKit",
            dependencies: []),
        .testTarget(
            name: "SwiftKitTests",
            dependencies: ["SwiftKit", "Quick", "Nimble", "MockingKit"]),
    ]
)
