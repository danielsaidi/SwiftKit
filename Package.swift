// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "SwiftKit",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftKit",
            targets: ["SwiftKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/danielsaidi/Quick.git", branch: "main"), // .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/danielsaidi/Nimble.git", branch: "main"), // .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/danielsaidi/MockingKit.git", .upToNextMajor(from: "1.1.0"))
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
