//
//  AppDependency.swift
//  TMATest
//
//  Created by kimtaeuk-N275 on 11/11/25.
//

import UIKit
import TMAShared
import MainFeature
import MainInterface
import CounterFeature
import CounterInterface
import WeatherFeature
import WeatherInterface
import SettingFeature
import SettingInterface

final class AppDependency: MainFactoryDependency, CounterFactoryDependency, WeatherFactoryDependency, SettingFactoryDependency {

    static let shared = AppDependency()
    private(set) var navigator: Navigator?

    // Factory들을 stored property로 변경 (lazy var로 한 번만 생성)
    lazy var mainFactory: MainFactory = MainFactoryImpl(external: self)
    lazy var weatherFactory: WeatherFactory = WeatherFactoryImpl(external: self)
    lazy var counterFactory: CounterFactory = CounterFactoryImpl(external: self)
    lazy var settingFactory: SettingFactory = SettingFactoryImpl(external: self)

    private init() {}

    func setNavigator(with tabBarController: UITabBarController) {
        self.navigator = AppNavigator(
            tabBarController: tabBarController,
            counterFactory: counterFactory,
            weatherFactory: weatherFactory,
            settingFactory: settingFactory
        )
    }
}
