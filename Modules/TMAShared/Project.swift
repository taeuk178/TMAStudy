import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TMAShared",
    targets: [
        .target(
            name: "TMAShared",
            destinations: [.iPhone],
            product: .staticFramework,
            bundleId: "com.TMATest.shared",
            deploymentTargets: .iOS("14.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                
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
