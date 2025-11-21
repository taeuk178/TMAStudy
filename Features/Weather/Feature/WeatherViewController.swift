//My template contents of name Weather

import UIKit
import WeatherInterface
import Then
import SnapKit
import ReactorKit
import RxCocoa

final public class WeatherViewController: UIViewController, View {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, Weather!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("API 요청", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()

    public init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public var disposeBag: DisposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    public func bind(reactor: WeatherReactor) {
        
        button.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.reactor?.action.onNext(.fetchWeatherData(lat: 35.12, lon: 127.0))
            }.disposed(by: disposeBag)
        
        reactor.state.compactMap(\.weatherData)
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(with: self) { owner, model in
                owner.label.text = "lat: \(model.latitude), lon: \(model.longitude)"
            }.disposed(by: disposeBag)
    }
}
