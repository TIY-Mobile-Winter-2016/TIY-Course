//
//  AppDelegate.swift
//  NSUserDefaultApp
//
//  Created by Phil Wright on 2/15/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

let todaysDateKey = "TodaysDateKey"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        writeDefaults()
        
        loadDefaults()

        return true
    }
    
    func writeDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(NSDate(), forKey: todaysDateKey)
        defaults.synchronize()
    }
    
    func loadDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let dateObject = defaults.objectForKey(todaysDateKey) {
            let today = dateObject as! NSDate
            print(today)
        } else {
            print("No Date Found")
        }
        
    }



}

