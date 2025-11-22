import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "MainFeature",
    targets: [
        .target(
            name: "MainExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "io.tuist.TMATest",
            infoPlist: .file(path: "FeatureExample/Info.plist"),
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
            sources: ["FeatureInterface/**"],
            dependencies: [
                .library(.TMAShared)
            ]
        ),
        .target(
            name: "MainFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: .defaultLibraries + [ 
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
