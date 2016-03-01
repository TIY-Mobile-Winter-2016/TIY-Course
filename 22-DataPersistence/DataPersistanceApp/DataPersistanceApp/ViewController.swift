//
//  ViewController.swift
//  DataPersistanceApp
//
//  Created by Phil Wright on 2/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

protocol MoviesProtocol {
    func passMoviesArray(moviesArray: [Movie])
}

class ViewController: UIViewController, MoviesProtocol {
    
    var moviesArray = [Movie]()
    let api = MoviesAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Make sure to set the delegate
        api.delegate = self
        
       // api.fetchMovies()

        
        
    }
    
    func passMoviesArray(moviesArray: [Movie]) {
        
        self.moviesArray = moviesArray
        
        for movie in self.moviesArray {
            print(movie.title)
            print(movie.releaseDate)
        }
        
        DataStore.sharedInstance.moviesArray = moviesArray
        DataStore.sharedInstance.saveChanges()
        
    }
    
    
    
    
}

