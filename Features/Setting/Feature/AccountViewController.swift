//
//  AccountViewController.swift
//  SettingFeature
//

import UIKit
import SnapKit
import Then

final class AccountViewController: UIViewController {

    private let titleLabel = UILabel().then {
        $0.text = "계정 설정 화면"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
    }

    private let descriptionLabel = UILabel().then {
        $0.text = "두 번째 화면입니다"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .gray
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    private lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .center
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(descriptionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "계정 설정"
        setup()
    }

    private func setup() {
        view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
