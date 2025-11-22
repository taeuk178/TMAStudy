//
//  Coordinator.swift
//  TMAShared
//

import UIKit

/// 기본 Coordinator 프로토콜
public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }

    /// Coordinator 시작
    func start()

    /// 특정 Route로 이동 (처리 가능하면 true 반환)
    @discardableResult
    func route(to route: AppRoute, animated: Bool) -> Bool
}

public extension Coordinator {
    /// Child Coordinator 추가
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    /// Child Coordinator 제거
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }

    /// 모든 Child Coordinator 제거
    func removeAllChildren() {
        childCoordinators.removeAll()
    }
}
