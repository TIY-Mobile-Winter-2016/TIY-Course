//
//  ViewController.swift
//  SimpleLocalNotification
//
//  Created by Phil Wright on 3/21/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var countLabel: UILabel!
    
    var timer: NSTimer?
    
    var count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func startNotify() {
    
        count = 5
        
        self.countLabel.text = "\(count)"
        
        let notification = UILocalNotification()
        
        notification.alertTitle = "Hello World"
        notification.alertBody = "This is the body of the notification"
        
        notification.fireDate = NSDate().dateByAddingTimeInterval(5)
        
        notification.applicationIconBadgeNumber = 5
        

        self.countLabel.text = "5"
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateCount", userInfo: nil, repeats: true)
        
        self.timer?.fire()
        
        print("scheduled at \(notification.fireDate)")
        
        
    }
    
    func updateCount() {
        count = count - 1
        
        if(count<=0) {
            count = 0
        }
        self.countLabel.text = "\(count)"
    }


}

