//My template contents of name Weather

import UIKit
import WeatherInterface

public protocol WeatherFactoryDependency {

}

public class WeatherFactoryImpl: Factory<WeatherFactoryDependency>, WeatherFactory {

    public func makeViewController() -> UIViewController {
        let fetchWeatherUseCase = FetchWeatherUseCaseImpl()
        return WeatherViewController(fetchWeatherUseCase: fetchWeatherUseCase)
    }
}


open class Factory<Dependency> {
    public let external: Dependency

    public init(external: Dependency) {
        self.external = external
    }
}
