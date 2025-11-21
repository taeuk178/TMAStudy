//My template contents of name Counter
import UIKit

public protocol CounterFactoryDependency {
    
}

public protocol CounterFactory {
    func makeViewController() -> UIViewController
}
