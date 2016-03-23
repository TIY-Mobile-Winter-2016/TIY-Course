//
//  ViewController.swift
//  SimpleRealm
//
//  Created by Phil Wright on 3/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    var personsArray = [Person]()
    
    var starshipsArray = [Starship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //seedPeople()
        
        //loadPersons()
        
        
        //        loadStarships()
        
        // queryPersons()
    }
    
    //MARK: - Table View Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.personsArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let person = self.personsArray[indexPath.row]
        
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    
    func seedPeople() {
        
        let luke = Person()
        luke.name = "Luke Skywalker"
        luke.createdAt = NSDate()
        
        let starship = Starship()
        starship.name = "X-wing"
        starship.createdAt = NSDate()
        starship.person = luke
        
        let starship2 = Starship()
        starship2.name = "Millennium Falcon"
        starship2.createdAt = NSDate()
        starship2.person = luke
        
        luke.starships.append(starship)
        luke.starships.append(starship2)
        
        do {
            try realm.write() { () -> Void in
                realm.add(luke)
                self.loadPersons()
            }
        } catch {
            print("An error occurred writing \(luke.name)")
        }
    }
    
    func savePerson(name: String) -> Person {
        
        let person = Person()
        person.name = name
        person.createdAt = NSDate()
        
        do {
            try realm.write() { () -> Void in
                realm.add(person)
                self.loadPersons()
            }
        } catch {
            print("An error occurred writing \(person.name)")
        }
        
        return person
    }
    
    @IBAction func addPerson() {
        
        let alertController = UIAlertController(title: "Add", message: "Add a new task", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) {
            (alertAction) -> Void in
            
            if let textField = alertController.textFields?.first,
                let name = textField.text {
                    self.savePerson(name)
                    self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            (alertAction) -> Void in
            
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
        }
        
        alertController.addAction(saveAction)
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    func loadPersons() {
        
        let persons = realm.objects(Person)
        
        self.personsArray.removeAll()
        
        print("Loaded \(persons.count) People from Realm")
        
        for p in persons {
            
            self.personsArray.append(p)
            
            print(p.name)
            print(p.createdAt)
            
            for s in p.starships {
                print(s.name)
                print(s.createdAt)
            }
        }
        
        self.tableView.reloadData()
        
    }
    
    func queryPersons() {
        
        // Query using a predicate string
        var persons = realm.objects(Person).filter("name = 'Phil'")
        
        // Query using an NSPredicate
        let predicate = NSPredicate(format: "name BEGINSWITH %@", "P")
        
        persons = realm.objects(Person).filter(predicate)
        
        self.personsArray.removeAll()
        
        for p in persons {
            
            self.personsArray.append(p)
            
            for s in p.starships {
                print(s.name)
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    
}

