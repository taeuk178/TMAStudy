//
//  CounterCoordinatorImpl.swift
//  CounterFeature
//

import UIKit
import TMAShared
import CounterInterface

public final class CounterCoordinatorImpl: CounterCoordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []

    private let factory: CounterFactory

    public init(
        navigationController: UINavigationController,
        factory: CounterFactory
    ) {
        self.navigationController = navigationController
        self.factory = factory
    }

    public func start() {
        showCounter()
    }

    public func route(to route: CounterRoute, animated: Bool = true) -> Bool {
        switch route {
        case .main:
            showCounter()
            return true
        }
    }

    public func showCounter() {
        let viewController = factory.makeViewController()
        // 백스택이 비어있으면 첫 화면으로 push
        if navigationController.viewControllers.isEmpty {
            navigationController.setViewControllers([viewController], animated: false)
        }
    }
}
