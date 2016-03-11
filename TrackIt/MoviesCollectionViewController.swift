//
//  MoviesCollectionViewController.swift
//  TrackIt
//
//  Created by Nina Ray on 1/8/16.
//  Copyright © 2016 Nina Ray. All rights reserved.
//
// - ONCE NEW MOVIE IS ADDED, THE DATA NEEDS TO CHANGE

import UIKit

private let reuseIdentifier = "Cell"

class MoviesCollectionViewController: UICollectionViewController {
    
    var movielist: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailMovie" {
            let destination = segue.destinationViewController as! DetailMovieViewController
            var cell: MoviesCollectionViewCell
            //var indexPath: NSIndexPath
            for item in self.collectionView!.visibleCells() as [UICollectionViewCell] {
                let indexPath: NSIndexPath = self.collectionView!.indexPathForCell(item as! MoviesCollectionViewCell)!
                cell = self.collectionView!.cellForItemAtIndexPath(indexPath) as! MoviesCollectionViewCell
            
            let selectedMovie: Movie = movielist[(collectionView?.indexPathForCell(cell)!.row)!]
            
            destination.movie = selectedMovie
            }

        }
    }
   
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movielist.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("firstMovie", forIndexPath: indexPath) as! MoviesCollectionViewCell
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    @IBAction func addNewMovie(sender: UIBarButtonItem) {
    }

    @IBAction func goToMovie(sender: UIButton) {
    }
    
    @IBAction func unwindToMovieViewCANCEL(sender: UIStoryboardSegue){
    }
    
    @IBAction func unwindToMovieViewSAVE (segue: UIStoryboardSegue) {
        let savedMovie = segue.sourceViewController as! AddMovieViewController
        if savedMovie.movieTitleField.text != "" {
            let newMovie = savedMovie.addNewMovie() //return a type Movie value
            movielist.append(newMovie)
            print("Successfully added Movie")
            collectionView?.reloadData()
        }
        else {
            print("Did not add Movie")
        }
        
    }
}
