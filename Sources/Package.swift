// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TWSign",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .executable(name: "TWSign", targets: ["TWSign"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "TWSign",
            dependencies: [],
            path: "Sources",
            resources: [
                .process("../Resources/Info.plist")
            ]
        )
    ]
)
