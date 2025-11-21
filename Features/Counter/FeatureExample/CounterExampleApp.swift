//
//  example.swift

import UIKit
import CounterFeature

@main
final class CounterExampleAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = CounterViewController()
        viewController.reactor = CounterReactor()
        window?.rootViewController = viewController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}
