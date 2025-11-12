//My template contents of name Weather

import UIKit

// MARK: - Models
public struct WeatherData {
    public let latitude: Double
    public let longitude: Double
    public let timezone: String

    public init(latitude: Double, longitude: Double, timezone: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.timezone = timezone
    }
}

// MARK: - UseCase
public protocol FetchWeatherUseCase {
    func execute() async throws -> WeatherData
}

// MARK: - Factory
public protocol WeatherFactory {
    func makeViewController() -> UIViewController
}
