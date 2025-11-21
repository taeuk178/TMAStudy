//My template contents of name Weather

import UIKit

public protocol WeatherFactoryDependency {

}

// MARK: - Models
public struct WeatherData: Codable, Equatable {
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
    func execute(lat: Double, lon: Double) async throws -> WeatherData
}

// MARK: - Factory
public protocol WeatherFactory {
    func makeViewController() -> UIViewController
}
