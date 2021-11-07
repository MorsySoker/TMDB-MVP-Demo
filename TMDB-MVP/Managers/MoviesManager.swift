//
//  MoviesManager.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 01/11/2021.
//

import Alamofire



/// _RequestMoviesListType_ is an enum for the different types of movie lists
enum RequestMoviesListType: String {
    case now_playing, popular, top_rated, upcoming
}



//MARK:- The API Manager for Movies
/// _MoviesManager_ is the object responsble for requesting Movie Lists
struct MoviesManager {
    
    //MARK:- Properties
    private let tmdbApiKey = "0239a6b8c4fdde147e59540aa782d0cf"
    
    

    //MARK:- Functions
    /// Fetching Movies Based of the Type of the List Requested
    ///
    /// - parameter type: The Type of Movie List To be Requested
    ///
    /// - Parameter completionHandler : A clouser responsble for handling The success and failure of Obtaning the Movie Object
    
    func fetchMovies(byListType type: RequestMoviesListType,
                     completionHandler: @escaping (Result<Movies, Error>) -> Void) {
        
        let MoviesPath = "https://api.themoviedb.org/3/movie/%@?api_key=%@&language=en-US"
        let MoviesURL = String(format: MoviesPath, type.rawValue, tmdbApiKey)
        
        AF.request(MoviesURL)
            .validate()
            .responseDecodable(of: Movies.self,
                               queue: .main,
                               decoder: JSONDecoder())
            { (response) in
                switch response.result {
                case.success(let movies):
                    completionHandler(.success(movies))
                case.failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
}
