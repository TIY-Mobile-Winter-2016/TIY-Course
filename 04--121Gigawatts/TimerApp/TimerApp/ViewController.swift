//
//  ViewController.swift
//  TimerApp
//
//  Created by Phil Wright on 2/4/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer?

    var count: Int = 30
    
    let speed : NSTimeInterval = 1.0
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        counterLabel.text = "\(count)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(speed,
            target: self,
            selector: "updateUI",
            userInfo: nil,
            repeats: true)
        
    }

    func updateUI() {
        
        count = count - 1
        
        if count > 0 {
            counterLabel.text = "\(count)"
        } else {
            counterLabel.text = "Done!"
            timer?.invalidate()
        }
    }

}

