// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "GIO",
    products: [
        .library(
            name: "GIO",
            targets: ["GIO"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/rpinz/SwiftGObject",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "GIO",
            dependencies: ["GLibObject"],
            path: "Sources"),
        .testTarget(
            name: "GIOTests",
            dependencies: ["GIO"])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
