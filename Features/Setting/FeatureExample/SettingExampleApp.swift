//
//  example.swift

import UIKit
import SettingFeature

@main
final class SettingExampleAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SettingViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
