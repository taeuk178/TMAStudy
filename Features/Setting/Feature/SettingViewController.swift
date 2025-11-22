//My template contents of name Setting

import UIKit
import SettingInterface
import TMAShared
import Then
import SnapKit

final public class SettingViewController: UIViewController {

    private let tableView = UITableView()
    private let tableData: [String] = [
        "첫 번째 화면",
        "두 번째 화면",
        "세 번째 화면",
    ]

    weak var coordinator: SettingCoordinator?

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "설정"
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
        case 0: // 첫 번째 화면 - Counter로 이동
            coordinator?.delegate?.settingCoordinatorDidRequestCounterTab(coordinator!)
        case 1: // 두 번째 화면
            coordinator?.showAccount()
        case 2: // 세 번째 화면
            coordinator?.showProfile()
        default:
            break
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
