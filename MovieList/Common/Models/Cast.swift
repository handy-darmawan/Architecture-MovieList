//
//  Cast.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import Foundation

struct Cast: Codable {
    let person: Person
}

struct Person: Codable {
    let id: Int
    let name: String
    let image: Image
}
