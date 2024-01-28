//
//  CastDTOMapper.swift
//  MovieList
//
//  Created by ndyyy on 24/01/24.
//

import Foundation

struct CastDTOMapper {
    static func map(_ dto: CastDTO) -> Cast {
        return Cast(
            id: dto.person.id,
            name: dto.person.name,
            mediumImage: URL(string: dto.person.image.medium) ?? URL(string: "https://via.placeholder.com/150x150")!
        )
    }
}
