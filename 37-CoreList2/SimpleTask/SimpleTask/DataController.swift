//
//  DataController.swift
//  SimpleCoreData
//
//  Created by Phil Wright on 3/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
    
    let objectModelNameString = "Tasks"
    
    var managedObjectContext: NSManagedObjectContext
    
    override  init() {
        
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = NSBundle.mainBundle().URLForResource(objectModelNameString, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        
        
        
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        // Create the Persistent Store Coordinator
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        
        
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        
        self.managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]
        
        /* The directory the application uses to store the Core Data store file.
        This code uses a file named "DataModel.sqlite" in the application's documents directory.
        */
        
        // Use the sqlite database in the documents directory
        
        let storeURL = docURL.URLByAppendingPathComponent("\(objectModelNameString).sqlite")
        
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            
            // Make sure you use fatalError -- this will ensure the App crashes
            
            fatalError("Error migrating store: \(error)")
        }
        
    }
}