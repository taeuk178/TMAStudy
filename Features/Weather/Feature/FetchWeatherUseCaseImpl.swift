//
//  FetchWeatherUseCaseImpl.swift
//  WeatherFeature
//
//  Created by kimtaeuk-N275 on 11/12/25.
//

import Foundation
import WeatherInterface

final class FetchWeatherUseCaseImpl: FetchWeatherUseCase {

    func execute() async throws -> WeatherData {
        // API 호출
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=37.57&longitude=126.98")!
        let urlRequest = URLRequest(url: url)

        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        // JSON 파싱
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]

        // 디버깅용 Pretty Print
        let prettyData = try JSONSerialization.data(withJSONObject: json ?? [:], options: .prettyPrinted)
        if let prettyString = String(data: prettyData, encoding: .utf8) {
            print("Pretty JSON:\n\(prettyString)")
        }

        // WeatherData 생성
        let latitude = json?["latitude"] as? Double ?? 0.0
        let longitude = json?["longitude"] as? Double ?? 0.0
        let timezone = json?["timezone"] as? String ?? ""

        return WeatherData(
            latitude: latitude,
            longitude: longitude,
            timezone: timezone
        )
    }
}
