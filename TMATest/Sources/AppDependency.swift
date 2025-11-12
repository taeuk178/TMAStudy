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

final class AppDependency: MainFactoryDependency, CounterFactoryDependency, WeatherFactoryDependency {
    
    static let shared = AppDependency()
    
    private init() {}

    var weatherFactory: WeatherFactory {
        return WeatherFactoryImpl(external: self)
    }
    
    var countFactory: CounterFactory {
        return CounterFactoryImpl(external: self)
    }
    
    var mainFactory: MainFactory {
        return MainFactoryImpl(external: self)
    }
}
