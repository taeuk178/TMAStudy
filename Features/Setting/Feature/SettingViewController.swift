//My template contents of name Setting

import UIKit
import TMAShared
import SettingInterface
import Then
import SnapKit

final public class SettingViewController: UIViewController {

    private var dependency: SettingFactoryDependency?
    private let tableView = UITableView()
    private let tableData: [String] = [
        "첫 번째 화면",
        "두 번째 화면",
        "세 번째 화면",
    ]

    public init(dependency: SettingFactoryDependency?) {
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
}

extension SettingViewController {
 
    private func setup() {
        
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
            $0.backgroundColor = .white
            self.view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            // Counter 화면은 push
            dependency?.navigator?.navigate(to: .counter, animated: true, presentationStyle: .present)
        case 1:
            // Weather 화면은 present
            dependency?.navigator?.navigate(to: .weather, animated: true, presentationStyle: .present)
        case 2:
            // Setting 화면은 push
            dependency?.navigator?.navigate(to: .setting, animated: true, presentationStyle: .push)
        default: break
        }
    }
}

final class TableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
