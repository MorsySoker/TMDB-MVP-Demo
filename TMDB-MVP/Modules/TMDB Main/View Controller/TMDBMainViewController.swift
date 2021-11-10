//
//  TMDBMainViewController.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 01/11/2021.
//

import UIKit

class TMDBMainViewController: UITableViewController {

    //MARK: Properties
    
    private let presenter = TMDBMainPresenter()
    
    private var movies: [MovieViewModel]?
    
    //MARK: - ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TMDBTableViewCell.nib(), forCellReuseIdentifier: TMDBTableViewCell.identifier)
        presenter.setViewDelegate(delegate: self)
        presenter.fetchMovies()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TMDBTableViewCell.identifier, for: indexPath) as! TMDBTableViewCell
        guard let movies = movies else {return cell}
        cell.configure(moviesViewModels: movies)
        return cell
    }
}

//MARK: - Conforming to tmdbMainpresenter Protocol
extension TMDBMainViewController: TMDBMainPresenterProtocol {
    
    func showMovies(movies: [MovieViewModel]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func showError(msg: String) {
        print(msg)
    }
    
    
    
}
