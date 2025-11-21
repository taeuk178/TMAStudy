//
//  FetchWeatherUseCaseImpl.swift
//  WeatherFeature
//
//  Created by kimtaeuk-N275 on 11/12/25.
//

import Foundation
import WeatherInterface
import NetworkKit

final class FetchWeatherUseCaseImpl: FetchWeatherUseCase {

    private let weatherProvider = CustomProvider<WeatherAPI>()
    
    func execute(lat: Double, lon: Double) async throws -> WeatherData {
        do {
            let weatherData: WeatherData = try await weatherProvider.requestMethod(.getWeatherData(lat: String(lat), lon: String(lon)))
            return weatherData
        } catch {
            return WeatherData(
                latitude: 0.0,
                longitude: 0.0,
                timezone: ""
            )
        }
    }
}
