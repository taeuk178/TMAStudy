import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "SettingFeature",
    targets: [
        .target(
            name: "SettingExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "SettingExampleApp",
            infoPlist: .default,
            sources: ["FeatureExample/**"],
            dependencies: [
                .target(name: "SettingFeature")
            ]
        ),
        .target(
            name: "SettingInterface",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["FeatureInterface/**"]
        ),
        .target(
            name: "SettingFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: .defaultLibraries + [
                .library(.TMAShared),
                .target(name: "SettingInterface")
            ]
        )
    ]
)
