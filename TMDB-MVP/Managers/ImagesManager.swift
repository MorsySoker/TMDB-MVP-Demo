//
//  ImagesManager.swift
//  TMDB-MVP
//
//  Created by MorsyElsokary on 01/11/2021.
//

import SDWebImage

/// _RequestImageQuailty_ is an enum for the different Quailties of an Image in Tmdb
enum RequestImageQuailty: String {
    case w500, original
}

// MARK:- The API Manager for Images

/// _ImagesManager_ is the object responsble for Fetching An image and passing it into an image view
struct ImagesManager {
    
    // MARK:- Properties
    
    private let baseImageURL = "https://image.tmdb.org/t/p/%@/%@"
    
    // MARK:- Function
    
    /// Fetching The image Based on the Image path and quality of the image from TMDB
    ///
    /// - parameter imageView: The image view The Fetched image will be passed to
    ///
    /// - Parameter qoImage : The image qualites TMDB offer ("original" is a higher quality Image , "w500" is a lower quality Image)
    ///
    /// - Parameter imgPath : the poster Image fetched from the TMDB API
    func setImageFromURL(forImageView imageView: UIImageView,
                         byQoImage qoImage: RequestImageQuailty,
                         withImgPath imgPath: String) {
        
        let imageURL = String(format:baseImageURL,
                              qoImage.rawValue, imgPath)
        
        imageView.sd_setImage(with: URL(string: imageURL),
                              placeholderImage: UIImage(named: "PlaceHolder"),
                              options: .highPriority,
                              completed: nil)
    }
}
