//
//  Artist.swift
//  SimpleDataPersistence
//
//  Created by Phil Wright on 3/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

let kName = "name"
let kAge = "age"
let kTrackArray = "trackArray"

class Artist: NSObject, NSCoding {
    
    var name: String = ""
    var age: Int = 20
    var tracksArray = [Track]()
    
    required init?(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObjectForKey(kName) as! String
        self.age = aDecoder.decodeIntegerForKey(kAge)
        self.tracksArray = aDecoder.decodeObjectForKey(kTrackArray) as! [Track]
        
        super.init()
    }
    
    override init() {
        
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: kName)
        aCoder.encodeInteger(age, forKey: kAge)
        aCoder.encodeObject(tracksArray, forKey: kTrackArray)
        
    }
    
    func debugDump() {
        print("\nArtist\n")
        print(name)
        print(age)
        
        for t in tracksArray {
            print("\nTrack\n")
            print(t.name)
            print(t.age)
        }
    }

}
