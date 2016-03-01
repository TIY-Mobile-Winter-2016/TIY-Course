//
//  Movie.swift
//  DataPersistanceApp
//
//  Created by Phil Wright on 2/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

// Constants for NSCoding
let kPosterPath = "posterPath"
let kBackdropPath = "backdropPath"
let kTitle = "title"
let kOverview = "overview"
let kMovieID = "movieID"
let kVoteAverage = "voteAverage"
let kVoteCount = "voteCount"
let kReleaseDate = "releaseDate"

class Movie: NSObject, NSCoding {

    var dateFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-mm-dd"
        return formatter
    }()
    
    let movieImageURL = "http://image.tmdb.org/t/p/w500/"

    var posterPath: String = ""
    var backdropPath: String = ""
    var title: String = ""
    var overview: String = ""
    var movieID: Int = 0
    var voteAverage: Double = 0.0
    var voteCount: Int = 0
    var releaseDate = NSDate()

    init(dict: JSONDictionary) {
        if let movieID = dict["id"] as? Int {
            self.movieID = movieID
            
        } else {
            print("Could not parse id")
        }
        
        if let original_title = dict["original_title"] as? String {
            self.title = original_title
        } else {
            print("Could not parse original_title")
        }
        
        if let overview = dict["overview"] as? String {
            self.overview = overview
        } else {
            print("Could not parse overview")
        }
        
        if let voteAverage = dict["vote_average"] as? Double {
            self.voteAverage = voteAverage
        } else {
            print("Could not parse vote_average")
        }
        
        if let voteCount = dict["vote_count"] as? Int {
            self.voteCount = voteCount
        } else {
            print("Could not parse vote_count")
        }
        
        if let posterPath = dict["poster_path"] as? String {
            self.posterPath = "\(self.movieImageURL)\(posterPath)"
        } else {
            print("Could not parse poster_path")
        }
        
        if let releaseDateString = dict["release_date"] as? String {
            if let date = self.dateFormatter.dateFromString(releaseDateString) {
                self.releaseDate = date
            } else {
                print("Could not convert releaseDate to NSDate")
            }
        } else {
            print("Could not parse release_date")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.posterPath = aDecoder.decodeObjectForKey(kPosterPath) as! String
        self.backdropPath = aDecoder.decodeObjectForKey(kBackdropPath) as! String
        self.title = aDecoder.decodeObjectForKey(kTitle) as! String
        self.overview = aDecoder.decodeObjectForKey(kOverview) as! String
        self.movieID = aDecoder.decodeIntegerForKey(kMovieID)
        self.voteAverage = aDecoder.decodeDoubleForKey(kVoteAverage)
        self.voteCount = aDecoder.decodeIntegerForKey(kVoteCount)
        self.releaseDate = aDecoder.decodeObjectForKey(kReleaseDate) as! NSDate
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(posterPath, forKey: kPosterPath)
        aCoder.encodeObject(backdropPath, forKey: kBackdropPath)
        aCoder.encodeObject(title, forKey: kTitle)
        aCoder.encodeObject(overview, forKey: kOverview)
        aCoder.encodeInteger(movieID, forKey: kMovieID)
        aCoder.encodeDouble(voteAverage, forKey: kVoteAverage)
        aCoder.encodeInteger(voteCount, forKey: kVoteCount)
        aCoder.encodeObject(releaseDate, forKey: kReleaseDate)
    }

}

