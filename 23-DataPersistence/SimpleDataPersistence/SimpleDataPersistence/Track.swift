//
//  Track.swift
//  SimpleDataPersistence
//
//  Created by Phil Wright on 3/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

let kTrackName = "trackName"
let kTrackAge = "trackAge"

class Track: NSObject, NSCoding {
    
    var name: String = ""
    var age: Int = 20
    
    required init?(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObjectForKey(kTrackName) as! String
        self.age = aDecoder.decodeIntegerForKey(kTrackAge)
        
        super.init()
    }
    
    override init() {
        
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: kTrackName)
        aCoder.encodeInteger(age, forKey: kTrackAge)
        
    }

}
