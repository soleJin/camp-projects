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

