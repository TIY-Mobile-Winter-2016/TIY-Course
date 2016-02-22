//
//  APIController.swift
//
//
//  Created by Phil Wright on 02/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class APIController
{
    var delegate: APIControllerProtocol
    
    
    // MARK: - Initializer
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func searchItunesFor(searchTerm: String) {
        
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) {
            
            let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music&entity=album"
            
            let url = NSURL(string: urlPath)
            
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithURL(url!, completionHandler: { data, response, error -> () in

                debugPrint("Task completed")
                
                if error != nil {
                    print(error?.localizedDescription)
                }
                else {
                    if let dictionary = self.parseJSON(data!) {
                        if let results: NSArray = dictionary["results"] as? NSArray {
                            self.delegate.didReceiveAPIResults(results)
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}