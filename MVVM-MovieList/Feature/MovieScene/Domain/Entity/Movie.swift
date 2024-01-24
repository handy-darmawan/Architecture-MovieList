//
//  Movie.swift
//  MVVM-MovieList
//
//  Created by ndyyy on 23/01/24.
//

import UIKit

struct Movie {
    let id: Int
    let name: String
    let type: TypeEnum
    let status: StatusEnum
    let averageRuntime: Int
    let summary: String
    let rating: Double
    let time: TimeEnum
    let days: [DayEnum]
    let genres: [GenreEnum]
    let mediumImage: URL
}
