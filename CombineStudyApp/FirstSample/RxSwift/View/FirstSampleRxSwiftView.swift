//
//  FirstSampleRxSwiftView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 03/03/23.
//

import Foundation
import UIKit

class FirstSampleRxSwiftView: UIView {

    let deviceFrame = UIScreen.main.bounds.size

    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: "neutralColor")
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var resultLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var resultTextfield: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor(named: "primaryColor")?.cgColor
        textField.placeholder = "Type something..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var resultButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(named: "primaryColor")
        button.layer.cornerRadius = 20
        button.setTitle("Send!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        self.addSubview(contentView)
        contentView.addSubview(resultLabel)
        contentView.addSubview(resultTextfield)
        contentView.addSubview(resultButton)

        NSLayoutConstraint.activate ([
            self.contentView.heightAnchor.constraint(equalToConstant: 180),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.resultLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.resultLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.resultLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.resultLabel.heightAnchor.constraint(equalToConstant: 32),

            self.resultTextfield.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: 16),
            self.resultTextfield.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.resultTextfield.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.resultTextfield.heightAnchor.constraint(equalToConstant: 50),

            self.resultButton.topAnchor.constraint(equalTo: self.resultTextfield.bottomAnchor, constant: 16),
            self.resultButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.resultButton.heightAnchor.constraint(equalToConstant: 40),
            self.resultButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
}
