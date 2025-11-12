//
//  CounterFactoryImpl.swift
//  CounterFeature
//
//  Created by kimtaeuk-N275 on 11/11/25.
//

import UIKit
import CounterInterface

public protocol CounterFactoryDependency {
    
}

public class CounterFactoryImpl: Factory<CounterFactoryDependency>, CounterFactory {
    
    public func makeViewController() -> UIViewController {
        return CounterViewController()
    }
}


open class Factory<Dependency> {
    public let external: Dependency

    public init(external: Dependency) {
        self.external = external
    }
}
