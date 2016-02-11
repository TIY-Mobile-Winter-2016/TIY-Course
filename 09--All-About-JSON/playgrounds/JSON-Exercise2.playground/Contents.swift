//: JSON - Loading from a File and Optionals

import UIKit

// Exercise 2
//
// Load file data.json

if let filePath = NSBundle.mainBundle().URLForResource("data", withExtension: "json") {
    if let data = NSData(contentsOfURL: filePath) {
        if let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding) {
            print(jsonString)
        }
    }
}

// How else can we unwrap the optionals?

if let fullPath = NSBundle.mainBundle().URLForResource("data", withExtension: "json"),
    let data = NSData(contentsOfURL: fullPath) {
        var strJSON = NSString(data: data, encoding: NSUTF8StringEncoding)
    }
















