// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "project1",
    dependencies: [
        .Package(url: "git@github.com:IBM-Swift/Kitura.git", majorVersion: 1),
        .Package(url: "git@github.com:IBM-Swift/HeliumLogger.git", majorVersion: 1),
        .Package(url: "git@github.com:IBM-Swift/Kitura-StencilTemplateEngine.git", majorVersion: 1)
    ]
)
