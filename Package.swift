// swift-tools-version:3.1
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription

let package = Package(
    name: "static-kitura",
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        Target(
            name: "static-kitura",
            dependencies: []),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7)
    ]
)
