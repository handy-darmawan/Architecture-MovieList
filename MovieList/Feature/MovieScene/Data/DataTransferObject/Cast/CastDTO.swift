//
//  CastDTO.swift
//  MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

struct CastDTO: Codable {
    let person: Person
    
    struct Person: Codable {
        let id: Int
        let name: String
        let image: Image
    }
    
    struct Image: Codable {
        let medium: String
        let original: String
    }
}


