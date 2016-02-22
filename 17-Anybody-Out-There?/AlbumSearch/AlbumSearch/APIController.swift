//
//  APIController.swift
//  AlbumSearch
//
//  Created by Phil Wright on 02/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]
    
    var delegate: APIControllerProtocol
    
    // MARK: - Initializer
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func searchItunesFor(searchTerm: String) {
        
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: .CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) {
            
            let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music&entity=album"
            
            if let url = NSURL(string: urlPath) {
                
                let session = NSURLSession.sharedSession()
                
                let task = session.dataTaskWithURL(url, completionHandler: { data, response, error -> () in
                    
                    debugPrint("Task completed")
                    
                    if error != nil {
                        debugPrint("An error occurred \(error)")
                    } else {
                        if let data = data,
                            let dictionary = self.parseJSON(data) {
                                if let results: NSArray = dictionary["results"] as? NSArray {
                                    self.delegate.didReceiveAPIResults(results)
                                }
                        }
                    }
                })
                task.resume()
            } else {
                debugPrint("The url \(urlPath) was not valid.")
            }
        }
    }
    
    func parseJSON(data: NSData) -> JSONDictionary?
    {
        do {
            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                return dict
            }
        }
        catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
}