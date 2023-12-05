// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCAStackNav",
    platforms: [
      .iOS(.v16), .macOS(.v13) // TOOO: Add a downported version of NavigationStacks to reach v13
    ],
    products: [
        .library(
            name: "TCAStackNav",
            targets: ["TCAStackNav"]),
    ],
    dependencies: [.package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.5.0"),],
    targets: [
        .target(
            name: "TCAStackNav",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]),
        .testTarget(
            name: "TCAStackNavTests",
            dependencies: ["TCAStackNav"]),
    ]
)
