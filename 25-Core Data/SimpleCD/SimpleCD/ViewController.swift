//
//  ViewController.swift
//  SimpleCD
//
//  Created by Phil Wright on 3/4/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let dataController = DataController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        seedPerson()
        
        fetchPersons()
        
        
        
        
    }
    
    func fetchPersons() {
        
        let mom = dataController.managedObjectContext
        
        let fetchPerson = NSFetchRequest(entityName: "Person")
        
        do {
            
            let persons = try mom.executeFetchRequest(fetchPerson) as! [Person]
            
            for p in persons {
                
                print(p.name)
                print(p.created)
                
                if let starships = p.starships {
                    
                    let starshipsArray = Array(starships) as! [Starship]
                    
                    for s in starshipsArray {
                        print(s.name)
                    }
                
                }
                
            }
            
            
        } catch {
            fatalError("I couldnt fetch the persons \(error)")
        }
        
        
    }
    
    func seedPerson() {
        
        let mom = dataController.managedObjectContext
  
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: mom) as! Person
        
        let today = NSDate()
        
        entity.setValue("Luke Skywalker", forKey: "name")
        entity.setValue("Male", forKey: "gender")
        entity.setValue(today, forKey: "created")
        
        let entityStarship = NSEntityDescription.insertNewObjectForEntityForName("Starship", inManagedObjectContext: mom) as! Starship
        
        entityStarship.setValue("X-wing", forKey: "name")
        entityStarship.setValue(today, forKey: "created")
        
        let starships = NSSet(object: entityStarship)
        
        entity.setValue(starships, forKey: "starships")
        
        

        
        
        do {
            
            try mom.save()
            
            print("I saved it!")
            
        } catch {
            
            fatalError("An error occurred saving Person and Starship entity \(error)")
        }
        
        
        
        
    }

}

