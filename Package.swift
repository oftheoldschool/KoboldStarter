// swift-tools-version: 5.10

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "KoboldStarter",
    platforms: [
        .iOS("17.0"),
        .macOS("14.0"),
    ],
    products: [
        .library(
            name: "KoboldStarter",
            targets: ["KoboldStarter"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/oftheoldschool/KoboldFramework.git", "0.0.1"..<"1.0.0"),
        .package(url: "https://github.com/swiftlang/swift-syntax", from: "509.0.0"),
    ],
    targets: [
        .target(
            name: "KoboldStarter",
            dependencies: [
                "KoboldStarterImpl",
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "KoboldFramework", package: "KoboldFramework"),
            ],
            path: "./Sources/KoboldStarter"
        ),
        .macro(
            name: "KoboldStarterImpl",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "KoboldFramework", package: "KoboldFramework"),
            ],
            path: "./Sources/KoboldStarterImpl"
        ),
    ]
)
