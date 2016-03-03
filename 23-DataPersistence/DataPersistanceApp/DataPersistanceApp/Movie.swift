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
    
    var title: String = ""
    var movieID: Int = 0

    required init?(coder aDecoder: NSCoder) {
        
        self.title = aDecoder.decodeObjectForKey(kTitle) as! String
        self.movieID = aDecoder.decodeIntegerForKey(kMovieID)
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(title, forKey: kTitle)
        aCoder.encodeInteger(movieID, forKey: kMovieID)
    }

}

