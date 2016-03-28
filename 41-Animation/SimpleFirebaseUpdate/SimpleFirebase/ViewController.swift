//
//  ViewController.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var notesArray = [Note]()
    
    let userRef = Firebase(url: "https://ironfire.firebaseio.com")
    
    let notesRef = Firebase(url: "https://ironfire.firebaseio.com/notes")
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // THIS IS REQUIRED
        addFirebaseObservers()
    
        let user = User()
        
        user.email = "phil@touchopia.com"
        user.password = "123456789"
        
        user.loginUser()
        
    }
    
    //MARK: - Seed Data
    
    func seedNote(index: Int) {
        let n = Note()
        n.title = "My Note at \(index)"
        n.isCompleted = false
        n.save()
    }
    
    
    //MARK: - Add Observer
    

    func addFirebaseObservers() {
        
        // Add Observer for Questions
        
        self.notesRef.observeEventType(.Value, withBlock: { snapshot in
            
            print(snapshot.value)
            
            self.notesArray = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    if let dict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let note = Note(key: key, dict: dict)
                        self.notesArray.insert(note, atIndex: 0)
                    }
                }
            }
        })
    }

}

