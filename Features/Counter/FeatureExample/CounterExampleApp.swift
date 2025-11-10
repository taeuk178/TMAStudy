//
//  example.swift

import UIKit
import CounterFeature

@main
final class CounterExampleAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CounterViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
