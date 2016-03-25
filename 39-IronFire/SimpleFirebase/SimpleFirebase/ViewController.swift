//
//  ViewController.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questionsArray = [Question]()
    
    let ref = Firebase(url: "https://ironfire.firebaseio.com")
    let usersRef = Firebase(url: "https://ironfire.firebaseio.com/online")
    let questionRef = Firebase(url: "https://ironfire.firebaseio.com/questions")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // THIS IS REQUIRED
        addFirebaseObservers()
    
        let user = User()
        
        user.email = "phil@touchopia.com"
        user.password = "123456789"
        
        user.loginUser()
        
    }
    
    func seedQuestion() {
        let q = Question()
        
        q.title = self.randomString(16)
        q.answerA = "A"
        q.answerB = "B"
        q.answerC = "C"
        q.answerD = "D"
        
        q.save()
    }
    
    func randomString(length: Int) -> String {
        
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<length) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
    func addFirebaseObservers() {
        
        // Add Observer for Questions
        
        self.questionRef.observeEventType(.Value, withBlock: { snapshot in
            
            print(snapshot.value)
            
            self.questionsArray = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    if let dict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let question = Question(key: key, dict: dict)
                        self.questionsArray.insert(question, atIndex: 0)
                    }
                }
            }
        })
    }

}

