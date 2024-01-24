//
//  MovieDTO.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

struct MovieDTO: Codable {
    let id: Int
    let name: String
    let type: TypeEnum
    let status: StatusEnum
    let averageRuntime: Int
    let summary: String
    let rating: Rating
    let schedule: Schedule
    let genres: [GenreEnum]
    let image: Image
    
    struct Rating: Codable {
        let average: Double?
    }

    struct Schedule: Codable {
        let time: TimeEnum
        let days: [DayEnum]
    }

    struct Image: Codable {
        let medium: String
        let original: String
    }

}
