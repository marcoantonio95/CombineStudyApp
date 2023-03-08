//
//  CharacterTableViewCell.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 06/03/23.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var specieLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
    }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
   }

    func configView() {
        self.backgroundColor = UIColor(named: "background")
        self.addSubview(photoImageView)
        self.addSubview(nameLabel)
        self.addSubview(specieLabel)

        NSLayoutConstraint.activate ([
            self.photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.photoImageView.widthAnchor.constraint(equalToConstant: 40),
            self.photoImageView.heightAnchor.constraint(equalToConstant: 40),
            self.photoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor, constant: 8),

            self.specieLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 4),
            self.specieLabel.leadingAnchor.constraint(equalTo: self.photoImageView.trailingAnchor, constant: 8),
            self.specieLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ])
    }
}
