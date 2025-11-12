//
//  MainFactoryImpl.swift
//  MainFeature
//
//  Created by kimtaeuk-N275 on 11/11/25.
//

import UIKit

import CounterInterface
import MainInterface
import WeatherInterface

public protocol MainFactoryDependency {
    var countFactory: CounterFactory { get }
    var weatherFactory: WeatherFactory { get }
}

final public class MainFactoryImpl: Factory<MainFactoryDependency>, MainFactory {
    
    public func makeViewController() -> UIViewController {
        return MainViewController(
            counterFactory: external.countFactory,
            weatherFactory: external.weatherFactory
        )
    }
}



open class Factory<Dependency> {
    public let external: Dependency

    public init(external: Dependency) {
        self.external = external
    }
}
