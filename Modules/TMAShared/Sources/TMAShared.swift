//
//  TMAShared.swift
//

import Foundation

open class Factory<Dependency> {
    public let external: Dependency

    public init(external: Dependency) {
        self.external = external
    }
}

public protocol CommonDependency {
    var navigator: Navigator? { get }
}

public enum PresentationStyle {
    case push
    case present
}

public enum Route {
    case counter
    case weather
    case setting

    public var tabIndex: Int {
        switch self {
        case .counter: return 0
        case .weather: return 1
        case .setting: return 2
        }
    }

    public var presentationStyle: PresentationStyle {
        switch self {
        case .counter: return .push
        case .weather: return .present
        case .setting: return .push
        }
    }
}

public protocol Navigator: AnyObject {
    func navigate(to route: Route, animated: Bool, presentationStyle: PresentationStyle)
    func handleDeepLink(_ url: URL) -> Bool
    func handlePushNotification(_ userInfo: [AnyHashable: Any]) -> Bool
}
