//
//  MainViewController.swift
//  MainFeature
//
//  Created by taeuk on 10/24/25.
//

import UIKit
import CounterInterface
import WeatherInterface
import SettingInterface
import Then
import SnapKit

final public class MainViewController: UITabBarController {

    private let counterFactory: CounterFactory
    private let weatherFactory: WeatherFactory
    private let settingFactory: SettingFactory

    // lazy var로 변경 - Navigator 초기화 이후에 생성됨
    private lazy var counterViewController: UINavigationController = {
        return templateNavigationController(
            title: "카운트",
            unselectedImage: UIImage(systemName: "number.circle"),
            selectedImage: UIImage(systemName: "number.circle.fill"),
            rootViewController: counterFactory.makeViewController(),
            tag: 0
        )
    }()

    private lazy var weatherViewController: UINavigationController = {
        return templateNavigationController(
            title: "날씨",
            unselectedImage: UIImage(systemName: "cloud.sun"),
            selectedImage: UIImage(systemName: "cloud.sun.fill"),
            rootViewController: weatherFactory.makeViewController(),
            tag: 1
        )
    }()

    private lazy var settingViewController: UINavigationController = {
        return templateNavigationController(
            title: "설정",
            unselectedImage: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill"),
            rootViewController: settingFactory.makeViewController(),
            tag: 2
        )
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    init(
        counterFactory: CounterFactory,
        weatherFactory: WeatherFactory,
        settingFactory: SettingFactory
    ) {
        self.counterFactory = counterFactory
        self.weatherFactory = weatherFactory
        self.settingFactory = settingFactory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        // lazy var 접근 - 이 시점에 생성됨
        viewControllers = [
            counterViewController,
            weatherViewController,
            settingViewController
        ]
    }
    
    private func templateNavigationController(
        title: String,
        unselectedImage: UIImage?,
        selectedImage: UIImage?,
        rootViewController: UIViewController,
        tag: Int
    ) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tag = tag
        return nav
    }
}
