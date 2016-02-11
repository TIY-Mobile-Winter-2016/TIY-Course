//: JSON - Loading from a File and Optionals

import UIKit

// Load file data.json

let filePath = NSBundle.mainBundle().URLForResource("data", withExtension: "json")

let data = NSData(contentsOfURL: filePath!)

let jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)

print(jsonString!)


// We used ! throughout this code to unwrap the optionals -- what is a safer way to do this?






