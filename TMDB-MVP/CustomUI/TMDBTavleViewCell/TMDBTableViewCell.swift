//
//  TMDBTableViewCell.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 01/11/2021.
//

import UIKit

class TMDBTableViewCell: UITableViewCell {

    //MARK:- Properties
    
    //static
    static let identifier = "TMDBTableViewCell"
    
    //private
    private let imgManager = ImagesManager()
    
    //public
    public var movieViewModels: [MovieViewModel] = []
    
    //MARK:- Outlet
    
    @IBOutlet var CollectionView: UICollectionView!
    @IBOutlet var collectionTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setupcollectionview()
    }
    
    func setupcollectionview(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        CollectionView.register(BasicPosterCollectionViewCell.nib(), forCellWithReuseIdentifier:                                    BasicPosterCollectionViewCell.identifier)
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = layout
        CollectionView.translatesAutoresizingMaskIntoConstraints = false
        CollectionView.backgroundColor = .white
        CollectionView.reloadData()
    }
    
    //MARK:- Static Function
    
    static func nib() -> UINib{
        return UINib(nibName: "TMDBTableViewCell", bundle: nil)
    }
    
}

extension TMDBTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 150, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicPosterCollectionViewCell.identifier, for: indexPath) as! BasicPosterCollectionViewCell
        return cell
    }
}
