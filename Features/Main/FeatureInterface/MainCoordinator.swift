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

    /// 특정 Route로 이동 (RouteType 사용 - 런타임에 구체 타입 판별)
    @discardableResult
    func routeToFeature(route: RouteType, animated: Bool) -> Bool
}
