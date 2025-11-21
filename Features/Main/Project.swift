import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "MainFeature",
    targets: [
        .target(
            name: "MainExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "MainExampleApp",
            infoPlist: .default,
            sources: ["FeatureExample/**"],
            dependencies: [
                .target(name: "MainFeature")
            ]
        ),
        .target(
            name: "MainInterface",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["FeatureInterface/**"]
        ),
        .target(
            name: "MainFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: .defaultLibraries + [
                .library(.NetworkKit), 
                .target(name: "MainInterface"),
                .project(
                    target: "CounterInterface",
                    path: "../Counter"
                ),
                .project(
                    target: "WeatherInterface",
                    path: "../Weather"
                ),
                .project(
                    target: "SettingInterface",
                    path: "../Setting"
                ),
            ]
        )
    ]
)
