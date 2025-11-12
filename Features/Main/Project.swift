import ProjectDescription

let project = Project(
    name: "MainFeature",
    targets: [
        .target(
            name: "MainExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "MainExampleApp",
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
            sources: ["FeatureInterface/**"]
        ),
        .target(
            name: "MainFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: [
                .target(name: "MainInterface"),
                .project(target: "CounterInterface",
                         path: "../Counter"),
            ]
        )
    ]
)
