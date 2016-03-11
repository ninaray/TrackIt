//
//  MoviesCollectionViewCell.swift
//  TrackIt
//
//  Created by Nina Ray on 1/8/16.
//  Copyright © 2016 Nina Ray. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    func setMovie (movie: Movie) {
        movieTitle.text = movie.title
    }

}
