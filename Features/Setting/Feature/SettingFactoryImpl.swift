//My template contents of name Setting

import UIKit
import SettingInterface

public protocol SettingFactoryDependency {

}

public class SettingFactoryImpl: Factory<SettingFactoryDependency>, SettingFactory {

    public func makeViewController() -> UIViewController {
        return SettingViewController()
    }
}


open class Factory<Dependency> {
    public let external: Dependency

    public init(external: Dependency) {
        self.external = external
    }
}
