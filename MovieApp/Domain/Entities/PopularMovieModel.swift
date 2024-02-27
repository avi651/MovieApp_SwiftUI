//
//  PopularMovieModel.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation

struct PopularMovieResquestModel {
   var popularMovieName: String
}

// MARK: - MovieResult
struct MovieResult: Codable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backDropPath: String
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Double
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backDropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backDropPath)")!
    }
}


extension Movie {
    static let dummyData: [Movie] = [
        Movie(adult: false, backDropPath: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", id: 969492, originalLanguage: "2022-05-04", originalTitle: "Doctor Strange in the Multiverse of Madness", overview: "", popularity: 7.5, posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", releaseDate: "2024-01-25", title: "Land of Bad", video: false, voteAverage: 7.162,voteCount:100),
        Movie(adult: false, backDropPath: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", id: 969492, originalLanguage: "2022-05-04", originalTitle: "Doctor Strange in the Multiverse of Madness", overview: "", popularity: 7.5, posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", releaseDate: "2024-01-25", title: "Land of Bad", video: false, voteAverage: 7.162,voteCount:100),
        Movie(adult: false, backDropPath: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", id: 969492, originalLanguage: "2022-05-04", originalTitle: "Doctor Strange in the Multiverse of Madness", overview: "", popularity: 7.5, posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", releaseDate: "2024-01-25", title: "Land of Bad", video: false, voteAverage: 7.162,voteCount:100),
    ]
}
