//
//  Movies.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import Foundation

struct MoviesResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}

// This is a Model o Entity into Module
struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let releaseDate: String
    let voteAverage: String
    // mas atributos del response
    let adult: Bool
    let backdropPath: String
    let originalTitle: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case title,overview, releaseDate, voteAverage, backdropPath, originalTitle
        case posterPath = "poster_path"
    }
    
}

