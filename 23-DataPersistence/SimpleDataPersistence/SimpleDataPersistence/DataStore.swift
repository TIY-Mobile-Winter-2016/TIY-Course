//
//  DataStore.swift
//  SimpleDataPersistence
//
//  Created by Phil Wright on 3/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    // Make it a Singleton
    
    static let sharedInstance = DataStore()
    override private init() { }
    
    var artistsArray = [Artist]()
    
    func loadArtists() -> Bool {
        let filePath = self.documentsDirectory().URLByAppendingPathComponent("artists.archive")
        
        if let archivedArtists = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as? [Artist] {
            
            self.artistsArray = archivedArtists
            
            for a in self.artistsArray {
                a.debugDump()
            }
            
            print("Saved in loadArtists()")
            
            return true
        } else {
            print("I had a problem")
        }
        return false
    }
    
    func saveArtists() -> Bool {
        
        let filePath = self.documentsDirectory().URLByAppendingPathComponent("artists.archive")

        return NSKeyedArchiver.archiveRootObject(artistsArray, toFile: filePath.path!)
    }
    
    //MARK: - Helper Methods
    
    func documentsDirectory() -> NSURL {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory
    }
    
}
