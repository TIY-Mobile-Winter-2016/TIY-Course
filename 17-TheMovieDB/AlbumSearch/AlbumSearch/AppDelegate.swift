//
//  AppDelegate.swift
//  AlbumSearch
//
//  Created by Phil Wright on 02/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        debugPrint("didFinishLaunchingWithOptions")
        
        // Create an instance of UIWindow using the bounds of the device screen
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Create an instance of our TableViewController
        let albumListVC = AlbumListTableViewController()
        
        // Create an instance of a UINavigationController - ensure that the rootViewController is passed into the initializer
        let navController = UINavigationController(rootViewController: albumListVC)
        
        // Assign the rootView of our window instance to our NavigationController
        window?.rootViewController = navController
        
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        debugPrint("applicationWillResignActive")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        debugPrint("applicationWillEnterBackground")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        debugPrint("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        debugPrint("applicationDidBecomeActive")
    }

    func applicationWillTerminate(application: UIApplication) {
        debugPrint("applicationWillTerminate")
    }


}

