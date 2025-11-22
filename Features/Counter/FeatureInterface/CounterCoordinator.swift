//
//  CounterCoordinator.swift
//  CounterFeature
//

import UIKit
import TMAShared

public protocol CounterCoordinator: Coordinator {
    /// Counter 화면으로 이동
    func showCounter()
}
