//My template contents of name Weather

import UIKit
import WeatherInterface
import Then
import SnapKit
import ReactorKit
import RxCocoa

final public class WeatherViewController: UIViewController, View {
        
    private let label = UILabel()
    private let button = UIButton(type: .custom)

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

extension WeatherViewController {
 
    private func setup() {
        
        label.do {
            $0.text = "Hello, Weather!"
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 24, weight: .medium)
            $0.numberOfLines = 0
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
        
        button.do {
            $0.setTitle("API 요청", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.red.cgColor
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.equalTo(label.snp.bottom).offset(50)
                make.centerX.equalToSuperview()
                make.width.equalTo(100)
                make.height.equalTo(40)
            }
        }
    }
}
