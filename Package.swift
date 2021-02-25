// swift-tools-version:5.3
import PackageDescription

// Version is technically not required here, SPM doesn't check
let version = "3.2.1"
// Tag is required to point towards the right asset. SPM requires the tag to follow semantic versioning to be able to resolve it.
let tag = "3.2.1-binary"
let checksum = "f2abd9a30517e7dd7216ea6b58bc60b4ac7fbcf47c23ceaa674a9e306e9cdfdf"
let url = "https://github.com/MonumentLabs/lottie-ios/releases/download/\(tag)/Lottie.xcframework.zip"

let package = Package(
    name: "Lottie",
    platforms: [.iOS(.v9)],
    // platforms: [.iOS("9.0"), .macOS("10.10"), tvOS("9.0"), .watchOS("2.0")],
    products: [
        .library(name: "Lottie", targets: ["Lottie"])
    ],
    targets: [
        .binaryTarget(
            name: "Lottie",
            url: url,
            checksum: "f2abd9a30517e7dd7216ea6b58bc60b4ac7fbcf47c23ceaa674a9e306e9cdfdf"
        )
    ]
)
