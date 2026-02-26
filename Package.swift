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
            name: "KoboldMacros",
            targets: ["KoboldMacros"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/oftheoldschool/KoboldFramework.git", "0.0.1"..<"1.0.0"),
        .package(url: "https://github.com/swiftlang/swift-syntax", from: "509.0.0"),
    ],
    targets: [
        .target(
            name: "KoboldMacros",
            dependencies: [
                "KoboldMacrosImpl",
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "KoboldFramework", package: "KoboldFramework"),
            ],
            path: "./Sources/KoboldMacros"
        ),
        .macro(
            name: "KoboldMacrosImpl",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "KoboldFramework", package: "KoboldFramework"),
            ],
            path: "./Sources/KoboldMacrosImpl"
        ),
    ]
)
