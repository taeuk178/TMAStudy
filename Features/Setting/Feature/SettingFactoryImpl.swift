//My template contents of name Setting

import UIKit
import SettingInterface
import TMAShared

public protocol SettingFactoryDependency {

}

public class SettingFactoryImpl: Factory<SettingFactoryDependency>, SettingFactory {

    public func makeViewController() -> UIViewController {
        return SettingViewController()
    }
}
