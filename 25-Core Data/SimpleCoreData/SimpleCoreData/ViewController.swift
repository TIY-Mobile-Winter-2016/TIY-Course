//
//  ViewController.swift
//  SimpleCoreData
//
//  Created by Phil Wright on 3/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
        let moc = DataController().managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()

        seedPersonPlusStarship()
        
        fetch()
    }

   
    func fetch() {
        let fetchPerson = NSFetchRequest(entityName: "Person")
        let fetchStarship = NSFetchRequest(entityName: "Starship")
        
        do {
            let fetchedPersons = try moc.executeFetchRequest(fetchPerson) as! [Person]

            for person in fetchedPersons {
                if let name = person.name {
                    print(name)
                }
            }
            
        } catch {
            fatalError("failure to fetch person \(error)")
        }
        
        do {
            let fetchedStarships = try moc.executeFetchRequest(fetchStarship) as! [Starship]
            
            for ship in fetchedStarships {
                if let name = ship.name {
                    print(name)
                }
            }
        } catch {
            fatalError("failure to fetch starship \(error)")
        }
    }

    func seedPersonPlusStarship() {
        

        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as! Person
        
        let today = NSDate()
        
        entity.setValue("Luke Skywalker", forKey: "name")
        entity.setValue("Male", forKey: "gender")
        entity.setValue(today, forKey: "created")
        
        let entityStarship = NSEntityDescription.insertNewObjectForEntityForName("Starship", inManagedObjectContext: moc) as! Starship
        
        entityStarship.setValue("Melennium Falcon", forKey: "name")
        entityStarship.setValue(today, forKey: "created")
        
        let entityStarship2 = NSEntityDescription.insertNewObjectForEntityForName("Starship", inManagedObjectContext: moc)
        
        entityStarship2.setValue("X-wing", forKey: "name")
        entityStarship2.setValue(today, forKey: "created")
        
        
        do {
            try moc.save()
            
        } catch {
            
            fatalError("failure to save context \(error)")
        }
        
        
    }

}

