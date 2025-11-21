//
//  AppDependency.swift
//  TMATest
//
//  Created by kimtaeuk-N275 on 11/11/25.
//

import Foundation

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
    
    private init() {}

    var mainFactory: MainFactory {
        return MainFactoryImpl(external: self)
    }
    
    var weatherFactory: WeatherFactory {
        return WeatherFactoryImpl(external: self)
    }
    
    var countFactory: CounterFactory {
        return CounterFactoryImpl(external: self)
    }
    
    var settingFactory: SettingFactory {
        return SettingFactoryImpl(external: self)
    }
}
