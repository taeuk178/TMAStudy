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
                .external(name: "SnapKit", condition: .none),
                .external(name: "Then", condition: .none),
                .external(name: "ReactorKit", condition: .none),
                .external(name: "RxSwift", condition: .none),
                .external(name: "RxCocoa", condition: .none),
                .project(
                    target: "NetworkKit",
                    path: "../../Modules/NetworkKit"
                ),
                .target(name: "MainInterface"),
                .project(
                    target: "CounterInterface",
                    path: "../Counter"
                ),
                .project(
                    target: "WeatherInterface",
                    path: "../Weather"
                ),
            ]
        )
    ]
)
