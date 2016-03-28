//
//  DataController.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class DataController {
    
    // The one and only sharedInstance
    static let sharedInstance = DataController()
    
    private init() {
        
    }

    let usersRef = Firebase(url: "https://ironfire.firebaseio.com/online")
    let baseRef = Firebase(url: "https://ironfire.firebaseio.com")
    let questionRef = Firebase(url: "https://ironfire.firebaseio.com/questions")
    
}

