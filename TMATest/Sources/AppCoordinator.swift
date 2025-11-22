//
//  AppCoordinator.swift
//  TMATest
//

import UIKit
import TMAShared
import MainInterface
import MainFeature
import CounterFeature
import WeatherFeature
import SettingFeature

final class AppCoordinator {
    private let window: UIWindow
    private var mainCoordinator: MainCoordinator?
    private let dependency: AppDependency

    init(window: UIWindow, dependency: AppDependency) {
        self.window = window
        self.dependency = dependency
    }

    func start() {
        // 각 Feature의 Coordinator 생성
        let counterNav = UINavigationController()
        let counterCoordinator = CounterCoordinatorImpl(
            navigationController: counterNav,
            factory: dependency.countFactory
        )

        let weatherNav = UINavigationController()
        let weatherCoordinator = WeatherCoordinatorImpl(
            navigationController: weatherNav,
            factory: dependency.weatherFactory
        )

        let settingNav = UINavigationController()
        let settingCoordinator = SettingCoordinatorImpl(
            navigationController: settingNav,
            factory: dependency.settingFactory
        )

        // MainCoordinator 생성 및 시작
        let mainCoord = MainCoordinatorImpl(
            counterCoordinator: counterCoordinator,
            weatherCoordinator: weatherCoordinator,
            settingCoordinator: settingCoordinator
        )
        mainCoord.start()

        window.rootViewController = mainCoord.tabBarController
        window.makeKeyAndVisible()

        self.mainCoordinator = mainCoord
    }

    /// 딥링크 처리
    func handle(url: URL) {
        guard let appRoute = AppRoute.from(url: url) else {
            print("❌ Invalid deeplink URL: \(url)")
            return
        }
        route(to: appRoute)
    }

    /// 푸시 알림 처리
    func handle(pushPayload: [String: Any]) {
        guard let appRoute = AppRoute.from(pushPayload: pushPayload) else {
            print("❌ Invalid push payload: \(pushPayload)")
            return
        }
        route(to: appRoute)
    }

    /// Route로 화면 이동 (백스택 쌓기)
    @discardableResult
    func route(to route: AppRoute, animated: Bool = true) -> Bool {
        guard let mainCoordinator = mainCoordinator else {
            print("❌ MainCoordinator not initialized")
            return false
        }

        let success = mainCoordinator.route(to: route, animated: animated)
        if success {
            print("✅ Successfully routed to: \(route)")
        } else {
            print("❌ Failed to route to: \(route)")
        }
        return success
    }
}
