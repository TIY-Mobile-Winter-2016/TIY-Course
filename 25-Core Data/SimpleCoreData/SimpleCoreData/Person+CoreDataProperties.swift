//
//  Person+CoreDataProperties.swift
//  SimpleCoreData
//
//  Created by Phil Wright on 3/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var gender: String?
    @NSManaged var created: NSDate?
    @NSManaged var starship: NSSet?

}
