//
//  MainCoordinator.swift
//  MainFeature
//

import UIKit
import TMAShared

public protocol MainCoordinator: AnyObject {
    var tabBarController: UITabBarController { get }

    /// Coordinator 시작
    func start()

    /// 특정 Route로 이동
    @discardableResult
    func route(to route: AppRoute, animated: Bool) -> Bool
}
