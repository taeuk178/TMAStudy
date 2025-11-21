//
//  AppNavigator.swift
//  TMAShared
//
//  Created by taeuk on 11/21/25.
//

import UIKit
import TMAShared
import CounterInterface
import WeatherInterface
import SettingInterface

final class AppNavigator: Navigator {
    
    private weak var tabBarController: UITabBarController?
    
    private let counterFactory: CounterFactory
    private let weatherFactory: WeatherFactory
    private let settingFactory: SettingFactory
    
    init(
        tabBarController: UITabBarController,
        counterFactory: CounterFactory,
        weatherFactory: WeatherFactory,
        settingFactory: SettingFactory
    ) {
        self.tabBarController = tabBarController
        self.counterFactory = counterFactory
        self.weatherFactory = weatherFactory
        self.settingFactory = settingFactory
    }
    
    func navigate(to route: Route, animated: Bool) {
        
        guard let tabBarController = tabBarController else { return }
        tabBarController.selectedIndex = route.tabIndex
        
        guard let navigationController = tabBarController.selectedViewController as? UINavigationController else { return }
        
        let viewController: UIViewController
        switch route {
        case .counter:
            viewController = counterFactory.makeViewController()
        case .weather:
            viewController = weatherFactory.makeViewController()
        case .setting:
            viewController = settingFactory.makeViewController()
        }
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func handleDeepLink(_ url: URL) -> Bool {
        
        guard url.scheme == "tsapp", let host = url.host else { return false }
        
        let route: Route?
        switch host {
        case "counter":
            route = .counter
        case "weather":
            route = .weather
        case "setting":
            route = .setting
        default:
            route = nil
        }
        
        guard let route else { return false }
        navigate(to: route, animated: true)
        return true
    }
    
    func handlePushNotification(_ userInfo: [AnyHashable : Any]) -> Bool {
        guard let screen = userInfo["xxxx"] as? String else {
            return false
        }
        
        let route: Route?
        switch screen {
        case "counter":
            route = .counter
        case "weather":
            route = .weather
        case "setting":
            route = .setting
        default:
            route = nil
        }
        
        guard let destination = route else { return false }
        navigate(to: destination, animated: true)
        return true
    }
}
