import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/tannernelson/vapor.git", majorVersion: 0),
        .Package(url: "https://github.com/tannernelson/vapor-stencil.git", majorVersion: 0),
        .Package(url: "https://github.com/stepanhruda/PostgreSQL-Swift.git", majorVersion: 0)
    ]

)
