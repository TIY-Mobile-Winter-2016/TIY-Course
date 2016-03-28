//
//  Question.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import Foundation
import Firebase

class Note {
    
    var key: String = ""
    
    var title: String = ""
    
    var isCompleted: Bool = false
    
    var noteRef = Firebase(url: "https://ironfire.firebaseio.com/notes")
    
    init() {
        
    }
    
    init(key: String, dict: Dictionary<String, AnyObject>) {
        
        self.key = key
        
        if let title = dict["title"] as? String {
            self.title = title
        }
        
        if let completed = dict["isCompleted"] as? Bool {
            self.isCompleted = completed
        }
        
        self.noteRef = self.noteRef.childByAppendingPath(self.key)
        
    }
    
    func save() {
        
        let dict: [String:AnyObject] = [
            "title": self.title,
            "isCompleted": self.isCompleted
        ]
        
        let firebaseNote = self.noteRef.childByAutoId()
        firebaseNote.setValue(dict)
    }

}