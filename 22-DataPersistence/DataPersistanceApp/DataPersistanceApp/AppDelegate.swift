//
//  AppDelegate.swift
//  DataPersistanceApp
//
//  Created by Phil Wright on 2/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if DataStore.sharedInstance.loadMovies() {
            print("Movies Loaded")
        } else {
            print("Could not load movies")
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        
        if DataStore.sharedInstance.saveChanges() {
            print("All Movies were Saved")
        } else {
            print("could not load movies")
        }
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

