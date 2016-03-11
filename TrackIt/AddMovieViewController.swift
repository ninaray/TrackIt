//
//  AddMovieViewController.swift
//  TrackIt
//
//  Created by Nina Ray on 1/9/16.
//  Copyright © 2016 Nina Ray. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    
    @IBOutlet weak var movieTitleField: UITextField!
    
    @IBOutlet weak var dateWatchedField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addNewMovie() -> Movie {
        if dateWatchedField.text == "" {
            getDateString(datePicker.date)
        }
        return Movie(title: movieTitleField.text!, date: dateWatchedField.text!)
    }
    
    func getDateString (date: NSDate) {
        let chosenDate = NSDateFormatter.localizedStringFromDate(date, dateStyle: .LongStyle, timeStyle: .NoStyle)
        dateWatchedField.text = chosenDate
    }
    
    @IBAction func chooseDateWatched(sender: UITextField) {
        datePicker.hidden = false
        if dateWatchedField.editing == false {
           datePicker.hidden = true
        }
    }
    
    @IBAction func finishChooseDate(sender: UIButton) {
        getDateString(datePicker.date)
        datePicker.resignFirstResponder()
        datePicker.hidden = true
    }
    
   // @IBAction func doneMovie(sender: UIButton) {
    //    if (movieTitleField.text != "") && (dateWatchedField.text != "") {
      //      addNewMovie()
        //}
       // else {
            //call error
       // }
   // }
    
    @IBAction func cancelMovie(sender: UIBarButtonItem) {
    }
    
}
