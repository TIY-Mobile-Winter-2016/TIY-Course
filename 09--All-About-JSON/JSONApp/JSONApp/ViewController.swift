//
//  ViewController.swift
//  JSONApp
//
//  Created by Phil Wright on 2/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//
//  Example of guard
//  cast a string -- String(x) or x as String
//
//
//

import UIKit

// typealias

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Step 1
        let (jsonString, data) = loadJSONFile("data", fileType: "json")
        
        print(jsonString)
        
        // Step 2
        
        if let data = data {
            do {
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let dict = object as? JSONDictionary {
                    
                    parseJSON(dict)
                    
                    
                }
            } catch {
                // Handle Error
                print("Something Went Wrong")
            }
        }
    }
    
    func parseJSON(dict: JSONDictionary) {
        print("\n\nDictionary\n\n \(dict)")
        
        print("\n\n------------------Finally Parsed!-------------\n\n")
        
        if let dataTitle = dict["dataTitle"] as? String {
            print(dataTitle)
        }
        
        if let swiftVersion = dict["swiftVersion"] as? Float {
            print(swiftVersion)
        }
        
        if let users = dict["users"] as? JSONArray {
            
            for user in users {
                
                if let name = user["name"] as? String {
                    print(name)
                }
                
                if let age = user["age"] as? Int {
                    print(age)
                }
            }
        }
    }
    
    func loadJSONFile(filename: String, fileType: String) -> (String, NSData?) {
        
        var returnString = ""
        var data: NSData? = nil
        
        guard let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileType) else { return (returnString, data) }
        
        if let jsondata = NSData(contentsOfURL: filePath) {
            if let jsonString = NSString(data: jsondata, encoding: NSUTF8StringEncoding) {
                returnString = jsonString as String
                data = jsondata
            }
        }
        return (returnString, data)
    }
    
}

