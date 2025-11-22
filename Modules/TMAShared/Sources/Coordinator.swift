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
