//
//  CounterFactoryImpl.swift
//  CounterFeature
//
//  Created by kimtaeuk-N275 on 11/11/25.
//

import UIKit
import CounterInterface
import TMAShared

public class CounterFactoryImpl: Factory<CounterFactoryDependency>, CounterFactory {
    
    public func makeViewController() -> UIViewController {
        let counterViewController = CounterViewController()
        counterViewController.reactor = CounterReactor()
        return counterViewController
    }
}
