//
//  ThirdSampleRxSwiftView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 06/03/23.
//

import UIKit

class ThirdSampleRxSwiftView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "characterCell")
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 62
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        configView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configView() {
        self.backgroundColor = UIColor(named: "background")
        self.addSubview(tableView)

        NSLayoutConstraint.activate ([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}
