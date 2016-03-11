//
//  DetailMovieViewController.swift
//  TrackIt
//
//  Created by Nina Ray on 2/10/16.
//  Copyright © 2016 Nina Ray. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var dateWatched: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie.title
        dateWatched.text = movie.date
    }

}
