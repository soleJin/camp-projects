//
//  HistoryTableViewCell.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    static var identifier: String {
        return "\(self)"
    }
    private let contentsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.systemGray4.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 1
        return view
    }()
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    private let lastModifiedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContentsContainerView()
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContentsContainerView() {
        contentView.addSubview(contentsContainerView)
        contentsContainerView.addSubview(historyLabel)
        contentsContainerView.addSubview(lastModifiedTimeLabel)
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            contentsContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentsContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentsContainerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            contentsContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            historyLabel.topAnchor.constraint(equalTo: contentsContainerView.topAnchor, constant: 5),
            historyLabel.leadingAnchor.constraint(equalTo: contentsContainerView.leadingAnchor, constant: 20),
            
            lastModifiedTimeLabel.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 5),
            lastModifiedTimeLabel.leadingAnchor.constraint(equalTo: contentsContainerView.leadingAnchor, constant: 20)
        ])
    }
    
    func fillLabels(item: HistoryItem) {
        lastModifiedTimeLabel.text = Date().timeToString
        historyLabel.text = item.behavior + " '\(item.item.title)'"
        guard let moveFrom = item.movedFrom else { return }
        historyLabel.text! += "  form \(moveFrom)"
        guard let moveTo = item.moveTo else { return }
        historyLabel.text! += " to \(moveTo)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        historyLabel.text = ""
        lastModifiedTimeLabel.text = ""
    }
}
