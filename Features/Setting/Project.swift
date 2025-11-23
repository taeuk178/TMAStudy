import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "SettingFeature",
    targets: [
        .target(
            name: "SettingExample",
            destinations: [.iPhone],
            product: .app,
            bundleId: "io.tuist.TMATest",
            infoPlist: .file(path: "FeatureExample/Info.plist"),
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
            sources: ["FeatureInterface/**"],
            dependencies: [
                .library(.TMAShared)
            ]
        ),
        .target(
            name: "SettingFeature",
            destinations: [.iPhone],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: .defaultLibraries + [
                .library(.TMAShared),
                .thirdParty(.DGCharts),
                .target(name: "SettingInterface")
            ]
        )
    ]
)
