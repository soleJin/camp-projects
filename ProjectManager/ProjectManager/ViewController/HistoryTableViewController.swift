//
//  HistoryTableViewController.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configrureView()
    }
    
    private func configrureView() {
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableView Delegate
extension HistoryTableViewController {
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - UITableView DataSource
extension HistoryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let historyList = History.shared.list
        return historyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell else {
            return UITableViewCell()
        }
        let item = History.shared.list[indexPath.row]
        cell.fillLabels(item: item)
        return cell
    }
}
