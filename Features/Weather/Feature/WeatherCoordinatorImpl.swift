//
//  WeatherCoordinatorImpl.swift
//  WeatherFeature
//

import UIKit
import TMAShared
import WeatherInterface

public final class WeatherCoordinatorImpl: WeatherCoordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []

    private let factory: WeatherFactory

    public init(
        navigationController: UINavigationController,
        factory: WeatherFactory
    ) {
        self.navigationController = navigationController
        self.factory = factory
    }

    public func start() {
        showWeatherMain()
    }

    public func route(to route: AppRoute, animated: Bool = true) -> Bool {
        switch route {
        case .weatherMain:
            showWeatherMain()
            return true
        case .weatherDetail(let cityId):
            // 백스택 쌓기: 메인 -> 상세
            showWeatherMain()
            showWeatherDetail(cityId: cityId)
            return true
        default:
            return false
        }
    }

    public func showWeatherMain() {
        let viewController = factory.makeViewController()
        // 백스택이 비어있으면 첫 화면으로 push
        if navigationController.viewControllers.isEmpty {
            navigationController.setViewControllers([viewController], animated: false)
        }
    }

    public func showWeatherDetail(cityId: String) {
        // TODO: WeatherDetailViewController 구현 후 추가
        // 지금은 placeholder로 빈 ViewController 사용
        let detailVC = UIViewController()
        detailVC.view.backgroundColor = .systemBackground
        detailVC.title = "날씨 상세 (\(cityId))"
        navigationController.pushViewController(detailVC, animated: true)
    }
}
