// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "SwiftKit",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "SwiftKit",
            targets: ["SwiftKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "10.0.0")),
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
