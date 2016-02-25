//
//  MovieTableViewCell.swift
//  ImageFromURLApp
//
//  Created by Phil Wright on 2/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie: Movie?

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    //MARK: - Movie Method
    
    func setTheMovieForCell(m: Movie?) {
        
        if let theMovie = m {
            
            self.movie = theMovie
            self.titleLabel.text = theMovie.title
            
            if let movieImage = theMovie.image {
                self.stopSpinner()
                self.cellImageView.image = movieImage
            } else {
                self.startSpinner()
                self.loadImageFromURL(theMovie.urlString)
            }
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func startSpinner() {
        self.spinner.startAnimating()
        self.spinner.hidden = false
    }
    
    func stopSpinner() {
        
        self.spinner.stopAnimating()
        self.spinner.hidden = true
    }
    
    func elapsedTime(startDate: NSDate) {
        
        let endDate = NSDate()
        
        let formatter = NSNumberFormatter()
        
        formatter.maximumFractionDigits = 4
        
        let timeInterval: Double = endDate.timeIntervalSinceDate(startDate);
        let numberString = formatter.stringFromNumber(timeInterval)
        print("elapsed Time: \(numberString!)")
        
    }
    
    
    func loadImageFromURL(urlString: String) {
        
        if urlString.isEmpty == false {
    
            let startDate = NSDate()
            
            if let url = NSURL(string: urlString) {
                
                // Step 1
                let session = NSURLSession.sharedSession()
                
                // Step 2
                let task = session.dataTaskWithURL(url, completionHandler: {
                    
                    (data, response, error) in
                    
                    
                    if error != nil {
                        debugPrint("An error occurred \(error)")
                        return
                    }
                    
                    let theFinalImage = UIImage(data: data!)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.cellImageView.image = theFinalImage
                        self.elapsedTime(startDate)
                        self.stopSpinner()                        
                    })
                    
                    self.movie?.image = theFinalImage
                })
                
                // Step 3
                task.resume()
                
            } else {
                print("Not a valid url")
            }
            
            
            
           // self.elapsedTime(startDate)
        } else {
            debugPrint("Invalid \(urlString)")
        }
    }
}
