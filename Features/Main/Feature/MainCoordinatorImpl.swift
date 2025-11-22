//
//  MainCoordinatorImpl.swift
//  MainFeature
//

import UIKit
import TMAShared
import MainInterface
import CounterInterface
import WeatherInterface
import SettingInterface

public final class MainCoordinatorImpl: MainCoordinator {
    public var tabBarController: UITabBarController

    private var counterCoordinator: CounterCoordinator
    private var weatherCoordinator: WeatherCoordinator
    private var settingCoordinator: SettingCoordinator

    public init(
        counterCoordinator: CounterCoordinator,
        weatherCoordinator: WeatherCoordinator,
        settingCoordinator: SettingCoordinator
    ) {
        self.counterCoordinator = counterCoordinator
        self.weatherCoordinator = weatherCoordinator
        self.settingCoordinator = settingCoordinator
        self.tabBarController = UITabBarController()

        // SettingCoordinator의 delegate 설정
        self.settingCoordinator.delegate = self
    }

    public func start() {
        setupTabBar()
    }

    public func routeToFeature(route: RouteType, animated: Bool = true) -> Bool {
        // RouteType의 구체 타입을 판별하여 적절한 Coordinator에 전달
        if let counterRoute = route as? CounterRoute {
            switchToTab(index: 0, animated: animated)
            return counterCoordinator.route(to: counterRoute, animated: animated)
        } else if let weatherRoute = route as? WeatherRoute {
            switchToTab(index: 1, animated: animated)
            return weatherCoordinator.route(to: weatherRoute, animated: animated)
        } else if let settingRoute = route as? SettingRoute {
            switchToTab(index: 2, animated: animated)
            return settingCoordinator.route(to: settingRoute, animated: animated)
        }

        return false
    }

    private func setupTabBar() {
        // Counter Tab
        let counterNav = counterCoordinator.navigationController
        counterCoordinator.start()
        counterNav.tabBarItem = UITabBarItem(
            title: "카운트",
            image: UIImage(systemName: "number.circle"),
            selectedImage: UIImage(systemName: "number.circle.fill")
        )

        // Weather Tab
        let weatherNav = weatherCoordinator.navigationController
        weatherCoordinator.start()
        weatherNav.tabBarItem = UITabBarItem(
            title: "날씨",
            image: UIImage(systemName: "cloud.sun"),
            selectedImage: UIImage(systemName: "cloud.sun.fill")
        )

        // Setting Tab
        let settingNav = settingCoordinator.navigationController
        settingCoordinator.start()
        settingNav.tabBarItem = UITabBarItem(
            title: "설정",
            image: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill")
        )

        tabBarController.viewControllers = [counterNav, weatherNav, settingNav]
    }

    private func switchToTab(index: Int, animated: Bool) {
        guard index < (tabBarController.viewControllers?.count ?? 0) else { return }
        tabBarController.selectedIndex = index
    }
}

// MARK: - SettingCoordinatorDelegate
extension MainCoordinatorImpl: SettingCoordinatorDelegate {
    public func settingCoordinatorDidRequestCounterTab(_ coordinator: SettingCoordinator) {
        // Setting에서 Counter 탭으로 이동 요청 처리
        self.routeToFeature(route: CounterRoute.main, animated: true)
    }
}
