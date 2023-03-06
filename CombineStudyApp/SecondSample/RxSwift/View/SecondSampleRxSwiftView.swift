//
//  SecondSampleRxSwiftView.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 06/03/23.
//

import Foundation
import UIKit

class SecondSampleRxSwiftView: UIView {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .remove
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.layer.masksToBounds = true
        label.text = "Downloaded image!"
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)
        self.configView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configView() {
        self.backgroundColor = UIColor(named: "background")
        self.addSubview(imageView)
        self.addSubview(textLabel)
        
        NSLayoutConstraint.activate ([
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
            self.imageView.widthAnchor.constraint(equalToConstant: 100),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.textLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 8),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])
    }
}
