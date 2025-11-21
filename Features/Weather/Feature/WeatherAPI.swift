//
//  WeatherAPI.swift
//  WeatherFeature
//
//  Created by kimtaeuk-N275 on 11/21/25.
//

import Foundation
import Moya

enum WeatherAPI {
    case getWeatherData(lat: String, lon: String)
}

extension WeatherAPI: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.open-meteo.com")!
    }
    
    var path: String {
        switch self {
        case .getWeatherData:
            return "v1/forecast"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case let .getWeatherData(lat, lon):
            let param: [String: Any] = [
                "latitude": lat,
                "longitude": lon
            ]
            return .requestParameters(
                parameters: param,
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
