//
//  BasicPosterCollectionViewCell.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 01/11/2021.
//

import UIKit

class BasicPosterCollectionViewCell: UICollectionViewCell {

    //MARK:- Properties
    
    //Static
    static let identifier = "BasicPosterCollectionViewCell"
    
    //MARK:- Outlets
    @IBOutlet var posterImageView: UIImageView! {
        didSet {
            posterImageView.layer.cornerRadius = 20
            posterImageView.clipsToBounds = true
        }
    }
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieReleaseDate: UILabel!
    
    //MARK:- View Loaded
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- Static Function

    static func nib() -> UINib{
        return UINib(nibName: "BasicPosterCollectionViewCell", bundle: nil)
    }
}




//"<NSLayoutConstraint:0x600000a73a70 UIStackView:0x7f9ef2507e60.height == 340   (active)>"
//
//"<NSLayoutConstraint:0x600000a73b60 V:[UIStackView:0x7f9ef2507e60]-(10)-|   (active, names: '|':UITableViewCellContentView:0x7f9ef25061e0 )>"
//
//"<NSLayoutConstraint:0x600000a73bb0 V:|-(10)-[UIStackView:0x7f9ef2507e60]   (active, names: '|':UITableViewCellContentView:0x7f9ef25061e0 )>"
//
//"<NSLayoutConstraint:0x600000a46d00 'UIView-Encapsulated-Layout-Height' UITableViewCellContentView:0x7f9ef25061e0.height == 360.333   (active)>"

