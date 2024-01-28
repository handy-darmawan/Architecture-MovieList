//
//  Movie.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let name: String
    let type: TypeEnum
    let status: StatusEnum
    let averageRuntime: Int
    let summary: String
    let rating: Rating
    let schedule: Schedule
    let genres: [Genre]
    let image: Image    
}

struct Rating: Codable {
    let average: Double?
}

struct Schedule: Codable {
    let time: Time
    let days: [Day]
}

struct Image: Codable {
    let medium: String
    let original: String
}
