//
//  MainViewController.swift
//  MainFeature
//
//  Created by taeuk on 10/24/25.
//

import UIKit

final public class MainViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setup()
    }
    
    public func testCode() {
        print("TEST CODE")
    }
    
    private func setup() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
