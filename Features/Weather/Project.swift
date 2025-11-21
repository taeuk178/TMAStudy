import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "WeatherFeature",
    targets: [
        .target(
            name: "WeatherExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "WeatherExampleApp",
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
            dependencies: .defaultLibraries + [
                .library(.NetworkKit),
                .library(.TMAShared),
                .target(name: "WeatherInterface")
            ]
        )
    ]
)
