//
//  WeatherCoordinator.swift
//  WeatherFeature
//

import UIKit
import TMAShared

public protocol WeatherCoordinator: Coordinator {
    /// Weather 메인 화면으로 이동
    func showWeatherMain()

    /// Weather 상세 화면으로 이동
    func showWeatherDetail(cityId: String)
}
