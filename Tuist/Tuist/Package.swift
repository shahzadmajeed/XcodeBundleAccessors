// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: ["DesignSystem": defaultProductType]
    )
#endif

let package = Package(
    name: "TuistBundleAccessors",
    platforms: [.iOS(.v16)],
    dependencies: [
        .package(path: "../../SpmPackage/DesignSystem")
    ]
)
