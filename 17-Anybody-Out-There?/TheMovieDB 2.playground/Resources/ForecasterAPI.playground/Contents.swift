

import Foundation
import XCPlayground

//: # Forecaster API

let cityString = "West Jordan, UT"

let latitude: Double = 40.609670
let longitude: Double = -111.939103

let apiKey = "34dab86640f64ddcb012ac6e009e7e22"

let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
let forecastURL = NSURL(string: "\(latitude),\(longitude)", relativeToURL: baseURL)

let data = NSData(contentsOfURL: forecastURL!)

do {
    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
        as? [String:AnyObject]
    
    print(jsonDictionary!)
    
    let timeZone = jsonDictionary?["timezone"]
    let hourlySummary = jsonDictionary?["hourly"]?["summary"]
    
    let currently = jsonDictionary?["currently"]
    
    let summary = currently?["summary"]
    let temperature = currently?["temperature"]
    let windSpeed = currently?["windSpeed"]
    let humidity = currently?["humidity"]

    
} catch {
    print("Error Parsing JSON")
}


