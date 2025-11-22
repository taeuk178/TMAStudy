//
//  SettingCoordinator.swift
//  SettingFeature
//

import UIKit
import TMAShared

/// SettingCoordinator의 이벤트를 상위 Coordinator에게 전달
public protocol SettingCoordinatorDelegate: AnyObject {
    /// 다른 탭으로 이동 요청
    func settingCoordinator(_ coordinator: SettingCoordinator, didRequestRoute route: AppRoute)
}

public protocol SettingCoordinator: Coordinator {
    var delegate: SettingCoordinatorDelegate? { get set }

    /// Setting 메인 화면으로 이동
    func showSettingMain()

    /// 계정 설정 화면으로 이동
    func showAccount()

    /// 프로필 설정 화면으로 이동
    func showProfile()

    /// 알림 설정 화면으로 이동
    func showNotification()
}
