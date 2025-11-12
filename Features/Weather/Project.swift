import ProjectDescription

let project = Project(
    name: "WeatherFeature",
    targets: [
        .target(
            name: "WeatherExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "WeatherExampleApp",
//            infoPlist: .file(path: "FeatureExample/Info.plist"),
            infoPlist: .default,
            sources: ["FeatureExample/**"],
            dependencies: [
                .target(name: "WeatherFeature")
            ]
        ),
        .target(
            name: "WeatherInterface",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["FeatureInterface/**"]
        ),
        .target(
            name: "WeatherFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: [
                .target(name: "WeatherInterface")
            ]
        )
    ]
)
