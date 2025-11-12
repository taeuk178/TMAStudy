//
//  example.swift

import UIKit
import WeatherFeature

@main
final class WeatherExampleAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WeatherViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
