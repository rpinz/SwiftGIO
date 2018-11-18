import PackageDescription

let package = Package(
    name: "GIO",
    dependencies: [
        .Package(url: "https://github.com/rpinz/SwiftGObject", majorVersion: 2)
    ],
    swiftLanguageVersions: [3]
)
