//
//  TMDBMainPresenter.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 07/11/2021.
//

import Foundation

    //MARK: - Presenter Protocol

protocol TMDBMainPresenterProtocol {
    func showMovies(movies: [MovieViewModel])
    func showError(msg: String)
}

   //MARK: - TMDBMainPresenter
/// _TMDBMainPresenter_ is the Presenter responsible for TMDBMain business logic & presentation Logic
final class TMDBMainPresenter {
    
    // MARK: - Properties
    
    private let worker: MoviesManager
    
    
    // MARK: - Init
    
    init(worker: MoviesManager) {
        self.worker = worker
    }
    
    // MARK: - Functions
    
    func fetchMovies() {
        worker.fetchMovies(byListType: .popular) { [weak self] result in
            
            guard let this = self else {return}
            switch result {
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
