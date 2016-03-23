//
//  AppDelegate.swift
//  SimpleLocalNotification
//
//  Created by Phil Wright on 3/21/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var player: AVAudioPlayer?

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
        
        if let url = NSBundle.mainBundle().URLForResource("photon", withExtension: "caf") {
            playSound(url)
        } else {
            print("Could find file photon")
        }
        
    }
    
    func playSound(url: NSURL) {
        
        do {
            let newPlayer = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
            
            newPlayer.numberOfLoops = 1
            newPlayer.prepareToPlay()
            newPlayer.play()
            
            self.player = newPlayer
            
        } catch let error as NSError {
            print(error.description)
        }
    }

}

