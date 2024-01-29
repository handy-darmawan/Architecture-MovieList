//
//  Cast.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import Foundation

struct Cast: Codable, Hashable {
    let person: Person
    let uuid = UUID().uuidString
}

struct Person: Codable, Hashable {
    let id: Int
    let name: String
    let image: Image
}
