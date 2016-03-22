//
//  Person.swift
//  SimpleRealm
//
//  Created by Phil Wright on 3/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import RealmSwift

class Person: Object {
    
    dynamic var name = ""
    dynamic var gender = ""
    dynamic var createdAt = NSDate()

    let starships = List<Starship>()
    
}
