//
//  Character.swift
//  CombineStudyApp
//
//  Created by Marco Antonio Oliveira on 02/03/23.
//
import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}
