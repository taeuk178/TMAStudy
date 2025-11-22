//
//  SettingRoute.swift
//  SettingInterface
//

import Foundation
import TMAShared

public enum SettingRoute: Equatable {
    case main
    case account
    case profile
    case notification
}

// TMAShared의 RouteType 준수
extension SettingRoute: RouteType {}
