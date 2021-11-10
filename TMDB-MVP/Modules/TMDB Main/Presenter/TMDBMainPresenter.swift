//
//  TMDBMainPresenter.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 07/11/2021.
//

import Foundation
import UIKit

    //MARK: - TypeAlies

typealias PresnterDelegate = TMDBMainPresenterProtocol & UIViewController

    //MARK: - Presenter Protocol

protocol TMDBMainPresenterProtocol {
    func showMovies(movies: [MovieViewModel])
    func showError(msg: String)
}

   //MARK: - TMDBMainPresenter
/// _TMDBMainPresenter_ is the Presenter responsible for TMDBMain business logic & presentation Logic
final class TMDBMainPresenter {
    
    // MARK: - Properties
    
    private let worker = MoviesManager()
    weak var delegate: PresnterDelegate?
    
    

    //MARK: - Set View Delegate
    
    func setViewDelegate(delegate: PresnterDelegate){
        self.delegate = delegate
    }
    
    // MARK: - Functions
    
    func fetchMovies() {
        worker.fetchMovies(byListType: .popular) { [weak self] result in
            
            guard let this = self else {return}
            switch result {
            case .success(let movies):
                this.convertToViewModel(movies: movies.all)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func convertToViewModel(movies: [Movie]){
         let movies = movies.compactMap {$0.model}
        self.delegate?.showMovies(movies: movies)
    }
    
}
