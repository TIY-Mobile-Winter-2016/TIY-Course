//
//  DataStore.swift
//  DataPersistanceApp
//
//  Created by Phil Wright on 2/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class DataStore: NSObject {
    
    // Make Singleton
    static let sharedInstance = DataStore()
    private override init() {}
    
    var moviesArray = [Movie]()
    
    let movieArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("movie.archive")
    }()
    
    func loadMovies() -> Bool {
        if let archivedMovies = NSKeyedUnarchiver.unarchiveObjectWithFile(self.movieArchiveURL.path!) as? [Movie] {
            
            self.moviesArray = archivedMovies
            
            print("Movies Count \(self.moviesArray.count)")
            printMovies()
            
            return true
            
        } else {
            print("Could not unarchiveMovies")
        }
        
        return false
    }
    
    func saveChanges() -> Bool {
        print("Saving movies to: \(movieArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(moviesArray, toFile: movieArchiveURL.path!)
    }
    
    func getMoviesCount() -> Int {
        return self.moviesArray.count
    }
    
    func printMovies() {
        for movie in moviesArray {
            print(movie.title)
            print(movie.releaseDate)
        }
    }
    
    
}