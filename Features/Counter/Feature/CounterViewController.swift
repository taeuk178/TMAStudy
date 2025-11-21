//My template contents of name Counter
import UIKit
import Then
import SnapKit
import ReactorKit
import RxCocoa

final public class CounterViewController: UIViewController, View {
    
    private let indexLabel = UILabel()
    private let decreaseButton = UIButton(type: .custom)
    private let increaseButton = UIButton(type: .custom)
    public var disposeBag: DisposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    public func bind(reactor: CounterReactor) {
        
        increaseButton.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.reactor?.action.onNext(.increase)
            }.disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.reactor?.action.onNext(.decrease)
            }.disposed(by: disposeBag)
        
        reactor.state.map(\.indexCount)
            .subscribe(with: self) { owner, count in
                owner.indexLabel.text = "\(count)"
            }.disposed(by: disposeBag)
    }
}

extension CounterViewController {
    
    private func setup() {
        
        indexLabel.do {
            $0.text = "0"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 24, weight: .bold)
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
        }
        
        decreaseButton.do {
            $0.setTitle("-", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.blue.cgColor
            $0.layer.borderWidth = 2
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.right.equalTo(indexLabel.snp.left).offset(-20)
                make.centerY.equalTo(indexLabel.snp.centerY)
                make.size.equalTo(50)
            }
        }
        
        increaseButton.do {
            $0.setTitle("+", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.red.cgColor
            $0.layer.borderWidth = 2
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.left.equalTo(indexLabel.snp.right).offset(20)
                make.centerY.equalTo(indexLabel.snp.centerY)
                make.size.equalTo(50)
            }
        }
        
        
    }
}
