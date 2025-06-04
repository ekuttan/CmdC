// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "CmdC",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "CmdC", targets: ["CmdC"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.5.0")
    ],
    targets: [
        .executableTarget(
            name: "CmdC",
            path: "CmdC",
            resources: [
                .process("Assets.xcassets"),
                .process("Preview Content")
            ]
        ),
        .testTarget(
            name: "CmdCTests",
            dependencies: [
                "CmdC",
                .product(name: "Testing", package: "swift-testing")
            ],
            path: "CmdCTests"
        ),
        .testTarget(
            name: "CmdCUITests",
            dependencies: ["CmdC"],
            path: "CmdCUITests"
        )
    ]
)
