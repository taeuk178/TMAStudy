//
//  MainViewController.swift
//  MainFeature
//
//  Created by taeuk on 10/24/25.
//

import UIKit
import CounterInterface
import WeatherInterface
import Then
import SnapKit

final public class MainViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let counterButton: UIButton = {
        let label = UIButton(type: .custom)
        label.setTitle("Counter화면", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherButton: UIButton = {
        let label = UIButton(type: .custom)
        label.setTitle("Weather화면", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let counterFactory: CounterFactory
    private let weatherFactory: WeatherFactory
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setup()
    }
    
    init(counterFactory: CounterFactory, weatherFactory: WeatherFactory) {
        
        self.counterFactory = counterFactory
        self.weatherFactory = weatherFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        view.addSubview(label)
        view.addSubview(counterButton)
        view.addSubview(weatherButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            counterButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            counterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            weatherButton.topAnchor.constraint(equalTo: counterButton.bottomAnchor, constant: 50),
            weatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        counterButton.addTarget(self, action: #selector(setButtonAction(_:)), for: .touchUpInside)
        weatherButton.addTarget(self, action: #selector(setButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func setButtonAction(_ sender: UIButton) {
        let counterViewController = counterFactory.makeViewController()
        self.present(counterViewController, animated: true)
    }
    
    @objc
    private func setButton(_ sender: UIButton) {
        let weatherViewController = weatherFactory.makeViewController()
        self.present(weatherViewController, animated: true)
    }
}
