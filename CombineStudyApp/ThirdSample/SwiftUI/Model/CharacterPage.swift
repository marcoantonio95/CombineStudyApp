//
//  CharacterPage.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 03/03/23.
//

import Foundation

struct CharacterPage: Codable {
    let info: Info
    let results: [Character]

    struct Info: Codable {
        let count, pages: Int
        let next, prev: String?
    }
}
