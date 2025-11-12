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

final class AppDependency: MainFactoryDependency, CounterFactoryDependency {
    
    static let shared = AppDependency()
    
    private init() {}
    
    var countFactory: CounterFactory {
        return CounterFactoryImpl(external: self)
    }
    
    var mainFactory: MainFactory {
        return MainFactoryImpl(external: self)
    }
}
