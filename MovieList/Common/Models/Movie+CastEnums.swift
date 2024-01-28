//
//  MovieEnums.swift
//  MovieList
//
//  Created by ndyyy on 06/01/24.
//

import Foundation

enum TypeEnum: String, Codable {
    case animation = "Animation"
    case documentary = "Documentary"
    case reality = "Reality"
    case scripted = "Scripted"
    case talkShow = "Talk Show"
}

enum StatusEnum: String, Codable {
    case ended = "Ended"
    case running = "Running"
    case toBeDetermined = "To Be Determined"
}

enum Day: String, Codable {
    case friday = "Friday"
    case monday = "Monday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    case thursday = "Thursday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
}

enum Time: String, Codable {
    case empty = ""
    case t0900 = "09:00"
    case t1200 = "12:00"
    case t1300 = "13:00"
    case t2000 = "20:00"
    case t2030 = "20:30"
    case t2100 = "21:00"
    case t2130 = "21:30"
    case t2200 = "22:00"
    case t2230 = "22:30"
    case t2300 = "23:00"
    case t2330 = "23:30"
}

enum Genre: String, Codable {
    case action = "Action"
    case adventure = "Adventure"
    case anime = "Anime"
    case comedy = "Comedy"
    case crime = "Crime"
    case drama = "Drama"
    case espionage = "Espionage"
    case family = "Family"
    case fantasy = "Fantasy"
    case history = "History"
    case horror = "Horror"
    case legal = "Legal"
    case medical = "Medical"
    case music = "Music"
    case mystery = "Mystery"
    case romance = "Romance"
    case scienceFiction = "Science-Fiction"
    case sports = "Sports"
    case supernatural = "Supernatural"
    case thriller = "Thriller"
    case war = "War"
    case western = "Western"
}
