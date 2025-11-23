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
                    ],
                    "NSLocationWhenInUseUsageDescription": "위치 데이터를 수집하여 고도 정보를 표시합니다."
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
                ),
                .project(
                    target: "SettingFeature",
                    path: "Features/Setting",
                )
            ]
        )
    ]
)
