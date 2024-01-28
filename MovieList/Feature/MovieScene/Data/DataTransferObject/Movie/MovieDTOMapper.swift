//
//  MovieDTOMapper.swift
//  MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

struct MovieDTOMapper {
    static func map(_ dto: MovieDTO) -> Movie {
        return Movie(id: dto.id,
                     name: dto.name,
                     type: dto.type,
                     status: dto.status,
                     averageRuntime: dto.averageRuntime,
                     summary: dto.summary,
                     rating: dto.rating.average ?? 0.0,
                     time: dto.schedule.time,
                     days: dto.schedule.days,
                     genres: dto.genres,
                     mediumImage: URL(string: dto.image.medium) ?? URL(string: "https://via.placeholder.com/150x150")!
        )
    }
}
