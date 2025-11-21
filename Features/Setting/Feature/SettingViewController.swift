//My template contents of name Setting

import UIKit
import TMAShared
import Then
import SnapKit

final public class SettingViewController: UIViewController {
    
    private let navigator: Navigator
    private let tableView = UITableView()
    private let tableData: [String] = [
        "첫 번째 화면",
        "두 번째 화면",
        "세 번째 화면",
    ]
    
    public init(navigator: Navigator) {
        self.navigator = navigator
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
            navigator.navigate(to: .counter, animated: true)
        case 1:
            navigator.navigate(to: .weather, animated: true)
        case 2:
            navigator.navigate(to: .setting, animated: true)
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
