//
//  AppRoute.swift
//  TMAShared
//

import Foundation

/// 앱 전체 라우팅 규칙
public enum AppRoute: Equatable {
    // Counter 관련
    case counterMain

    // Weather 관련
    case weatherMain
    case weatherDetail(cityId: String)

    // Setting 관련
    case settingMain
    case settingAccount
    case settingProfile
    case settingNotification
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
            return .counterMain
        case "weather":
            if pathComponents.count >= 3, pathComponents[1] == "detail" {
                return .weatherDetail(cityId: pathComponents[2])
            }
            return .weatherMain
        case "setting":
            if pathComponents.count >= 2 {
                switch pathComponents[1] {
                case "account": return .settingAccount
                case "profile": return .settingProfile
                case "notification": return .settingNotification
                default: return .settingMain
                }
            }
            return .settingMain
        default:
            return nil
        }
    }

    /// 푸시 Payload에서 Route 생성
    static func from(pushPayload: [String: Any]) -> AppRoute? {
        guard let screen = pushPayload["screen"] as? String else { return nil }

        switch screen {
        case "counter_main":
            return .counterMain
        case "weather_main":
            return .weatherMain
        case "weather_detail":
            if let cityId = pushPayload["cityId"] as? String {
                return .weatherDetail(cityId: cityId)
            }
            return .weatherMain
        case "setting_main":
            return .settingMain
        case "setting_account":
            return .settingAccount
        case "setting_profile":
            return .settingProfile
        case "setting_notification":
            return .settingNotification
        default:
            return nil
        }
    }
}
