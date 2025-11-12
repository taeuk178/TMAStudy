//
//  MainViewController.swift
//  MainFeature
//
//  Created by taeuk on 10/24/25.
//

import UIKit
import CounterInterface

final public class MainViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let label = UIButton(type: .custom)
        label.setTitle("화면 테스트임", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let counterFactory: CounterFactory
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setup()
    }
    
    init(counterFactory: CounterFactory) {
        
        self.counterFactory = counterFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        button.addTarget(self, action: #selector(setButtonAction(_:)), for: .touchUpInside)
    }
    
    @objc
    private func setButtonAction(_ sender: UIButton) {
        let counterViewController = counterFactory.makeViewController()
        self.present(counterViewController, animated: true)
    }
}
