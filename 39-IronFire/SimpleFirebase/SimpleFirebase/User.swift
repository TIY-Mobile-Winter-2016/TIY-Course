//
//  User.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

class FireFile {
    
    var image: UIImage?
    var data: NSData = NSData()
    
    var fileRef = Firebase(url: "https://ironfire.firebaseio.com/firefile")
    
    init() {
        
    }
    
    func save() {
        
        if let image = self.image {
            data = UIImageJPEGRepresentation(image,0.1)!
            let base64String = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        }
        
    }
    
    
    
}