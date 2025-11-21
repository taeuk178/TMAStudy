//My template contents of name Weather

import UIKit
import WeatherInterface
import TMAShared

public class WeatherFactoryImpl: Factory<WeatherFactoryDependency>, WeatherFactory {

    public func makeViewController() -> UIViewController {
        let fetchWeatherUseCase = FetchWeatherUseCaseImpl()
        let weatherReactor = WeatherReactor(fetchWeatherUseCase: fetchWeatherUseCase)
        let weatherViewController = WeatherViewController()
        weatherViewController.reactor = weatherReactor
        return weatherViewController
    }
}
