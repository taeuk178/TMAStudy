//
//  AppRoute.swift
//  TMATest
//

import Foundation
import TMAShared
import CounterInterface
import WeatherInterface
import SettingInterface

/// 앱 전체 라우팅 규칙
/// 각 Feature의 Route를 감싸는 상위 레벨 Route
public enum AppRoute: Equatable {
    case counter(CounterRoute)
    case weather(WeatherRoute)
    case setting(SettingRoute)
}

// MARK: - DeepLink/Push Payload 변환
public extension AppRoute {
    /// 딥링크 URL에서 Route 생성
    static func from(url: URL) -> AppRoute? {
        // URL 파싱 로직 (예시)
        // myapp://weather/detail/12345
        let pathComponents = url.pathComponents.filter { $0 != "/" }

        guard let first = pathComponents.first else { return nil }

        switch first {
        case "counter":
            return .counter(.main)
        case "weather":
            if pathComponents.count >= 3, pathComponents[1] == "detail" {
                return .weather(.detail(cityId: pathComponents[2]))
            }
            return .weather(.main)
        case "setting":
            if pathComponents.count >= 2 {
                switch pathComponents[1] {
                case "account": return .setting(.account)
                case "profile": return .setting(.profile)
                case "notification": return .setting(.notification)
                default: return .setting(.main)
                }
            }
            return .setting(.main)
        default:
            return nil
        }
    }

    /// 푸시 Payload에서 Route 생성
    static func from(pushPayload: [String: Any]) -> AppRoute? {
        guard let screen = pushPayload["screen"] as? String else { return nil }

        switch screen {
        case "counter_main":
            return .counter(.main)
        case "weather_main":
            return .weather(.main)
        case "weather_detail":
            if let cityId = pushPayload["cityId"] as? String {
                return .weather(.detail(cityId: cityId))
            }
            return .weather(.main)
        case "setting_main":
            return .setting(.main)
        case "setting_account":
            return .setting(.account)
        case "setting_profile":
            return .setting(.profile)
        case "setting_notification":
            return .setting(.notification)
        default:
            return nil
        }
    }
}
