// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LaunchDarklySwiftUI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "LaunchDarklySwiftUI",
            targets: ["LaunchDarklySwiftUI"]),
    ],
    dependencies: [
        .package(name: "LaunchDarkly", url: "https://github.com/launchdarkly/ios-client-sdk.git", .upToNextMinor(from: "5.1.0")),
        .package(name: "LaunchDarkly+Combine", url: "https://github.com/ericlewis/LaunchDarkly-Combine.git", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "LaunchDarklySwiftUI",
            dependencies: ["LaunchDarkly", "LaunchDarkly+Combine"],
            path: "Sources")
    ]
)
