// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [:]
    )
#endif

let package = Package(
    name: "TMATest",
    dependencies: [
        .package(url: "https://github.com/devxoul/Then", exact: "3.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit", exact: "5.7.1"),
        .package(url: "https://github.com/ReactorKit/ReactorKit", exact: "3.2.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift", exact: "6.8.0"),
        .package(url: "https://github.com/Moya/Moya", exact: "15.0.3"),
        .package(url: "https://github.com/danielgindi/Charts.git", exact: "5.1.0")
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
