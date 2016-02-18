import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/tannernelson/vapor.git", majorVersion: 0),
        .Package(url: "https://github.com/tannernelson/vapor-stencil.git", majorVersion: 0),
        .Package(url: "https://github.com/Zewo/PostgreSQL.git", majorVersion: 0, minor: 2)
    ]

)
