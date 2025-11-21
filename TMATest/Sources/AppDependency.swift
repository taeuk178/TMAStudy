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
    
    private init() {}
    
    func setNavigator(with tabBarController: UITabBarController) {
        self.navigator = AppNavigator(
            tabBarController: tabBarController,
            counterFactory: counterFactory,
            weatherFactory: weatherFactory,
            settingFactory: settingFactory
        )
    }

    var mainFactory: MainFactory {
        return MainFactoryImpl(external: self)
    }
    
    var weatherFactory: WeatherFactory {
        return WeatherFactoryImpl(external: self)
    }
    
    var counterFactory: CounterFactory {
        return CounterFactoryImpl(external: self)
    }
    
    var settingFactory: SettingFactory {
        return SettingFactoryImpl(external: self)
    }
}
