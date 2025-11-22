//
//  SettingCoordinatorImpl.swift
//  SettingFeature
//

import UIKit
import TMAShared
import SettingInterface

public final class SettingCoordinatorImpl: SettingCoordinator {
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    public weak var delegate: SettingCoordinatorDelegate?

    private let factory: SettingFactory

    public init(
        navigationController: UINavigationController,
        factory: SettingFactory
    ) {
        self.navigationController = navigationController
        self.factory = factory
    }

    public func start() {
        showSettingMain()
    }

    public func route(to route: AppRoute, animated: Bool = true) -> Bool {
        switch route {
        case .settingMain:
            showSettingMain()
            return true
        case .settingAccount:
            // 백스택 쌓기: 메인 -> 계정 설정
            showSettingMain()
            showAccount()
            return true
        case .settingProfile:
            // 백스택 쌓기: 메인 -> 프로필 설정
            showSettingMain()
            showProfile()
            return true
        case .settingNotification:
            // 백스택 쌓기: 메인 -> 알림 설정
            showSettingMain()
            showNotification()
            return true
        default:
            return false
        }
    }

    public func showSettingMain() {
        let viewController = factory.makeViewController()

        // Coordinator 주입
        if let settingVC = viewController as? SettingViewController {
            settingVC.coordinator = self
        }

        // 백스택이 비어있으면 첫 화면으로 push
        if navigationController.viewControllers.isEmpty {
            navigationController.setViewControllers([viewController], animated: false)
        }
    }

    public func showAccount() {
        let accountVC = AccountViewController()
        navigationController.pushViewController(accountVC, animated: true)
    }

    public func showProfile() {
        // TODO: ProfileViewController 구현 후 추가
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .systemBackground
        profileVC.title = "프로필 설정"
        navigationController.pushViewController(profileVC, animated: true)
    }

    public func showNotification() {
        // TODO: NotificationViewController 구현 후 추가
        let notificationVC = UIViewController()
        notificationVC.view.backgroundColor = .systemBackground
        notificationVC.title = "알림 설정"
        navigationController.pushViewController(notificationVC, animated: true)
    }
}
