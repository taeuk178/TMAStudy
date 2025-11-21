import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CounterFeature",
    targets: [
        .target(
            name: "CounterExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "CounterExampleApp",
            infoPlist: .default,
            sources: ["FeatureExample/**"],
            dependencies: [
                .target(name: "CounterFeature")
            ]
        ),
        .target(
            name: "CounterInterface",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["FeatureInterface/**"]
        ),
        .target(
            name: "CounterFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: .defaultLibraries + [
                .library(.TMAShared),
                .target(name: "CounterInterface")
            ]
        )
    ]
)
