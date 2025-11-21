//My template contents of name Setting

import UIKit
import SettingInterface
import TMAShared

public class SettingFactoryImpl: Factory<SettingFactoryDependency>,
  SettingFactory {

      public func makeViewController() -> UIViewController {
          guard let navigator = external.navigator else {
              fatalError("Navigator가 초기화되지 않았습니다.")
          }
          return SettingViewController(navigator: navigator)
      }
  }
