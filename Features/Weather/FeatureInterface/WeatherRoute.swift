//
//  WeatherRoute.swift
//  WeatherInterface
//

import Foundation
import TMAShared

public enum WeatherRoute: Equatable {
    case main
    case detail(cityId: String)
}

// TMAShared의 RouteType 준수
extension WeatherRoute: RouteType {}
