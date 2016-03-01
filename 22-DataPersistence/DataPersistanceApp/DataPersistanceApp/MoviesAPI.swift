//
//  MoviesAPI.swift
//  DataPersistanceApp
//
//  Created by Phil Wright on 3/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class MoviesAPI: NSObject {
    
    var delegate: MoviesProtocol?
    
    static let apiKey = "f51678dcb1e8e91622ee0f91f733ebb2"
    
    let movieImageURL = "http://image.tmdb.org/t/p/w500/"
    
    let baseURL = "http://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
    
    override init() {
        
    }
    
    func fetchMovies() {
        
        let url = NSURL(string: baseURL)
        
        var moviesArray = [Movie]()
        
        if let url = url {
            
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                
                if let data = data {
                    
                    let dict = self.parseJSON(data)
                    
                    if let results = dict?["results"] as? JSONArray {
                        
                        for result in results {
                            
                            //print(result)
                            
                            if let dict = result as? JSONDictionary {
                                let m = Movie(dict: dict)
                                moviesArray.append(m)
                            }
                        }
                    } else {
                        print("Cold not parse results")
                    }
                } else {
                    print("Could Not Parse Data")
                }
                
                // Call the delegate
                self.delegate?.passMoviesArray(moviesArray)
                
            })
            task.resume()
        }
    }
    
    func parseJSON(data: NSData?) -> JSONDictionary? {
        do {
            if let data = data,
                dictionary = try
                    NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                        return dictionary
            }
        } catch {
            print("An error occurred while parsing json")
        }
        return nil
    }
}