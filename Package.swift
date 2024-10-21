// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CircomWitnesscalc",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CircomWitnesscalc",
            targets: ["CircomWitnesscalc"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CircomWitnesscalc",
            dependencies: ["C"],
            path: "Sources/CircomWitnesscalc",
            sources: ["CircomWitnesscalc.swift"]
        ),
        .target(
            name: "C",
            dependencies: ["libwitness"],
            path: "Sources/C"),
        .binaryTarget(
            name: "libwitness",
            path: "Libs/libwitness.xcframework"),
        .testTarget(
            name: "CircomWitnesscalcTests",
            dependencies: ["CircomWitnesscalc"])
    ]
)