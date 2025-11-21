//My template contents of name Setting

import UIKit
import TMAShared

public protocol SettingFactory {
    func makeViewController() -> UIViewController
}

public protocol SettingFactoryDependency: CommonDependency {
    var navigator: Navigator? { get }
}
