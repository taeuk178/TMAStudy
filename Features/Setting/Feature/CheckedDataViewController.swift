//
//  CheckedDataViewController.swift
//  SettingFeature
//
//  Created by taeuk on 11/23/25.
//

import UIKit
import CoreLocation
import CoreMotion

import SnapKit
import Then
import ReactorKit
import RxCocoa
import DGCharts

final class CheckedDataViewController: UIViewController, View {

    private let speedLabel = UILabel()
    private let TimerLabel = UILabel()
    private let meterLabel = UILabel()
    private let labelStackView = UIStackView()
    private let button = UIButton(type: .custom)
    var disposeBag: DisposeBag = DisposeBag()

    private let coreLocation = CLLocationManager()
    private let motionManager = CMMotionManager()  // 가속도 센서
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()

        // delegate 설정 시 locationManagerDidChangeAuthorization이 자동 호출됨
        coreLocation.delegate = self

        // 가속도 센서 시작
        startAccelerometer()
    }

    private func startAccelerometer() {
        guard motionManager.isDeviceMotionAvailable else {
            return
        }

        motionManager.deviceMotionUpdateInterval = 0.25
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            guard let self = self, let motion = motion else { return }

            // 사용자 가속도 (중력 제거됨)
            let userAccel = motion.userAcceleration

            // 가속도 크기 계산 (3축 합성)
            let accelMagnitude = sqrt(
                pow(userAccel.x, 2) +
                pow(userAccel.y, 2) +
                pow(userAccel.z, 2)
            )

            // 가속도 크기를 속도 지표로 사용 (0-10 범위로 스케일링)
            let speedIndicator = accelMagnitude * 10

            // UI 업데이트
            DispatchQueue.main.async {
                if accelMagnitude > 0.1 {  // 움직임 감지
                    self.speedLabel.text = "움직임: \(String(format: "%.1f", speedIndicator))"
                } else {
                    self.speedLabel.text = "움직임: 정지 상태"
                }
            }
        }
    }

    func bind(reactor: CheckedDataReactor) {
        
        button.rx.tap
            .subscribe(with: self) { owner, _ in
                print("12345")
            }.disposed(by: disposeBag)
    }
    
    private func checkedLocateAuthorization() {

        let authorizationStatus = coreLocation.authorizationStatus
        switch authorizationStatus {
        case .notDetermined:
            coreLocation.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            // 네비게이션용 최고 정확도 - 속도 측정에 최적화
            coreLocation.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            coreLocation.distanceFilter = kCLDistanceFilterNone  // 모든 이동 감지
            coreLocation.startUpdatingLocation()
        case .denied:
            showLocationPermissionAlert()
        default: break
        }
    }

    private func showLocationPermissionAlert() {
        let alert = UIAlertController(
            title: "위치 권한 필요",
            message: "위치 정보를 사용하려면 설정에서 권한을 허용해주세요.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL)
            }
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        present(alert, animated: true)
    }
}

extension CheckedDataViewController: CLLocationManagerDelegate {

    // 권한 상태 변경 시 호출됨
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkedLocateAuthorization()
    }

    // 위치 업데이트 수신 (고도 측정용)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else { return }

        let altitude = location.altitude
        let accuracy = location.horizontalAccuracy

        print("""
        📍 위치 업데이트:
        - 고도: \(altitude)m
        - 정확도: \(accuracy)m \(accuracy < 0 ? "❌ 무효" : accuracy < 20 ? "✅ 좋음" : "⚠️ 낮음")
        """)

        // 고도 UI 업데이트
        meterLabel.text = "고도: \(Int(altitude))m"
    }

    // 위치 업데이트 실패 시
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("❌ 위치 업데이트 실패: \(error.localizedDescription)")
    }
}

extension CheckedDataViewController {
    
    private func setupView() {

        labelStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
                make.width.equalTo(200)
            }
        }
        
        speedLabel.do {
            $0.text = "움직임: 측정 중..."
            $0.textColor = .black
            $0.textAlignment = .left
            labelStackView.addArrangedSubview($0)
        }
        
        TimerLabel.do {
            $0.text = "타이머"
            $0.textColor = .black
            $0.textAlignment = .left
            labelStackView.addArrangedSubview($0)
        }
        
        meterLabel.do {
            $0.text = "고도: 대기 중..."
            $0.textColor = .black
            $0.textAlignment = .left
            labelStackView.addArrangedSubview($0)
        }
        
        button.do {
            $0.setTitle("버튼", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.blue.cgColor
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.equalTo(self.labelStackView.snp.bottom).offset(20)
                make.centerX.equalTo(self.labelStackView.snp.centerX)
                make.width.equalTo(60)
                make.height.equalTo(30)
            }
        }
    }
}
