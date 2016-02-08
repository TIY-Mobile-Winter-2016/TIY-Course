//: # Parsing JSON

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = false

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [AnyObject]


class Hero {
    var name: String
    var powers: String
    var homeworld: String
    
    init(name: String, powers: String, homeworld: String) {
        self.name = name
        self.powers = powers
        self.homeworld = homeworld
    }
}


var jsonString = ""

if let filepath = NSBundle.mainBundle().pathForResource("heros", ofType: "json") {
    do {
        jsonString = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
    } catch {
        print("Could not load data")
    }
} else {
    print("heros not found")
}

var herosArray = [Hero]()

let str = String(jsonString)

let data = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)

do {
    if let data = data,
        namesArray = try
            NSJSONSerialization.JSONObjectWithData(data, options: []) as?
        JSONArray {
            for result in namesArray {
                
                if let jsonResult = result as? JSONDictionary {
                    
                    //print(jsonResult)
                    
                    var hero = Hero(name: "", powers: "", homeworld: "")
                    
                    if let name = jsonResult["name"] as? String {
                        hero.name = name
                    }
                    
                    if let homeworld = jsonResult["homeworld"] as? String {
                        hero.homeworld = homeworld
                    }
                    
                    if let powers = jsonResult["powers"] as? String {
                        hero.powers = powers
                    }
                    
                    herosArray.append(hero)
                }
            }
    }
} catch {
    print("An error occurred")
}


for hero in herosArray {
    print(hero.name)
}



