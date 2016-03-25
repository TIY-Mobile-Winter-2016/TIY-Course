//
//  User.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class User {

    var email: String = ""
    var password: String = ""
    var authData: String = ""
    
    var userRef = Firebase(url: "https://ironfire.firebaseio.com")
    
    init() {
        
    }
    
    func createUser() {
        
        // 1
        self.userRef.createUser(self.email, password: self.password) { (error: NSError!) in
            
            // 2
            if error == nil {
                print("Created user \(self.email)")
                self.loginUser()
                
            } else {
                print("An error occurred \(error.localizedDescription)")
            }
        }
    
    }
    
    func loginUser() {
        
        // Authenticate User
        self.userRef.authUser(self.email, password: self.password,
                              withCompletionBlock: { (error, auth) -> Void in

                                if error == nil {
                                    print("user logged in")
                                    print(auth)
                                    
                                    self.authData = String(auth)
                                    
                                } else {
                                    print("An error occurred while logging in user \(self.email)")
                                }
        })

    }
    
    
    
}