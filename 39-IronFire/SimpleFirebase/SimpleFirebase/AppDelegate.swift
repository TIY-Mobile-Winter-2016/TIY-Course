//
//  AppDelegate.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print("\(__FUNCTION__)")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
         print("\(__FUNCTION__)")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        print("\(__FUNCTION__)")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        print("\(__FUNCTION__)")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("\(__FUNCTION__)")
    }

    func applicationWillTerminate(application: UIApplication) {
        print("\(__FUNCTION__)")
    }


}

