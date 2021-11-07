//
//  Movies.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 01/11/2021.
//

import Foundation

//MARK:- Movie Response Model
struct Movie: Codable {
    
    var movieTitle, movieReleaseData, movieOverView: String
    var movieBackdropPath: String
    var moviePosterPath: String
    var movieId: Int
    var movieScore: Double
    var adultRated: Bool
    
    
    enum CodingKeys: String, CodingKey {
        
        case movieId = "id"
        case movieTitle = "title"
        case moviePosterPath = "poster_path"
        case movieReleaseData = "release_date"
        case movieScore = "vote_average"
        case movieBackdropPath = "backdrop_path"
        case adultRated = "adult"
        case movieOverView = "overview"
    }
    
    var model: MovieViewModel {
        return MovieViewModel(movieTitle: movieTitle,
                              movieReleaseData: movieReleaseData,
                              movieOverView: movieOverView,
                              movieBackdropPath: movieBackdropPath,
                              moviePosterPath: moviePosterPath,
                              movieId: movieId,
                              movieScore: movieScore,
                              adultRated: adultRated)
    }
}


//MARK:- Movies Response Model
struct Movies: Codable {
    
    var count: Int
    var all: [Movie]
    
    enum CodingKeys: String, CodingKey {
        
        case count = "total_results"
        case all = "results"
    }
}

//MARK:- Movie View Model

struct MovieViewModel {
    let movieTitle, movieReleaseData, movieOverView: String
    let movieBackdropPath: String
    let moviePosterPath: String
    let movieId: Int
    let movieScore: Double
    let adultRated: Bool
}
