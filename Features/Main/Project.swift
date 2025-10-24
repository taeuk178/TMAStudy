import ProjectDescription

let project = Project(
    name: "MainFeature",
    targets: [
        .target(
            name: "MainExample",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "MainExampleApp",
            infoPlist: .extendingDefault(with: ["UILaunchScreen": ""]),
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
