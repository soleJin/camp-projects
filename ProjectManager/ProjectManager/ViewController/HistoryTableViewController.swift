//
//  HistoryTableViewController.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    private var historyTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configrureView()
        configureAutoLayout()
    }
    
    private func configrureView() {
        view.addSubview(historyTableView)
    }
    
    private func configureAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            historyTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
