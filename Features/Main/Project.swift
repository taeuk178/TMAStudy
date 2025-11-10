import ProjectDescription

let project = Project(
    name: "MainFeature",
    settings: .settings(
        base: [
            "IPHONEOS_DEPLOYMENT_TARGET": "15.0"
        ]
    ),
    targets: [
        .target(
            name: "MainExample",
            destinations: [.iPhone, .iPad],
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
            destinations: [.iPhone, .iPad],
            product: .staticLibrary,
            bundleId: "",
            sources: ["FeatureInterface/**"]
        ),
        .target(
            name: "MainFeature",
            destinations: [.iPhone, .iPad],
            product: .staticLibrary,
            bundleId: "",
            sources: ["Feature/**"],
            dependencies: [
                .target(name: "MainInterface")
            ]
        )
    ]
)
