//
//  CounterCoordinator.swift
//  CounterFeature
//

import UIKit
import TMAShared

public protocol CounterCoordinator: Coordinator {
    /// Counter 화면으로 이동
    func showCounter()

    /// Counter Route로 이동
    @discardableResult
    func route(to route: CounterRoute, animated: Bool) -> Bool
}
