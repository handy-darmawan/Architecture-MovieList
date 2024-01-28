//
//  CastService.swift
//  MovieList
//
//  Created by ndyyy on 07/01/24.
//

import Foundation

/*
  API RESOURCES
    - Person: https://api.tvmaze.com/shows/{ShowsID}/cast
 */


protocol CastServiceProtocol {
    func fetchCast(id: Int, completion: @escaping ([Cast]) -> Void) async
}


class CastService: CastServiceProtocol {
    func fetchCast(id: Int, completion: @escaping ([Cast]) -> Void) async {
        let url = URL(string: "https://api.tvmaze.com/shows/\(id)/cast")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let cast = try JSONDecoder().decode([Cast].self, from: data)
                completion(cast)
            } catch {
                completion([])
            }
        }
        .resume()
    }
}
