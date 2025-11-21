import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TMATest",
    targets: [
        .target(
            name: "TMATest",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TMATest",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                    "UIApplicationSceneManifest": [
                        "UIApplicationSupportsMultipleScenes": false,
                        "UISceneConfigurations": [
                            "UIWindowSceneSessionRoleApplication": [
                                [
                                    "UISceneConfigurationName": "Default Configuration",
                                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                                ]
                            ]
                        ]
                    ]
                ]
            ),
            sources: ["TMATest/Sources/**"],
            resources: ["TMATest/Resources/**"],
            dependencies: [
                .project(
                    target: "MainFeature",
                    path: "Features/Main",
                ),
                .project(
                    target: "CounterFeature",
                    path: "Features/Counter",
                ),
                .project(
                    target: "WeatherFeature",
                    path: "Features/Weather",
                )
            ]
        )
    ]
)
