//
//  CounterRoute.swift
//  CounterInterface
//

import Foundation
import TMAShared

public enum CounterRoute: Equatable {
    case main
}

// TMAShared의 RouteType 준수
extension CounterRoute: RouteType {}
