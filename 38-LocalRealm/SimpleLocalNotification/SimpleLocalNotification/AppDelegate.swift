//
//  AppDelegate.swift
//  SimpleLocalNotification
//
//  Created by Phil Wright on 3/21/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Ensure Permission is Granted for Local Notifications
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Sound, .Badge], categories: nil)
        application.registerUserNotificationSettings(settings)
        
        //
        
        return true
    }
    
    // Implement didReceiveLocalNotificaton to receive in app notifications
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        // Could use notification object here
        
        print("\(__FUNCTION__) : Got the Local Notification")
        
        
        
    }


}

