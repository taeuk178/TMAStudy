import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "NetworkKit",
    targets: [
        .target(
            name: "NetworkKit",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.TMATest.network",
            deploymentTargets: .iOS("14.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "Moya", condition: .none)
            ],
            settings: .settings(
                base: SettingsDictionary(),
                configurations: [
                    .debug(name: .debug),
                    .release(name: .release)
                ]
            )
        )
    ]
)
