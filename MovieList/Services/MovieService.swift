//
//  MovieServices.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import UIKit

/*
  API RESOURCES
    - Movie: https://api.tvmaze.com/shows
 */

protocol MovieServiceProtocol {
    func fetchMovies(completion: @escaping ([Movie]) -> Void) async
}

class MovieService: MovieServiceProtocol {
    func fetchMovies(completion: @escaping ([Movie]) -> Void) async {
        let url = URL(string: "https://api.tvmaze.com/shows")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(movies)
            } catch {
                completion([])
            }
        }
        .resume()
    }
}


