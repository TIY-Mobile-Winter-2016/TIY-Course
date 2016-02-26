//
//  ViewController.swift
//  SimpleDateFormat
//
//  Created by Phil Wright on 2/26/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timestampTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.timestampTextField.becomeFirstResponder()
        
        self.dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let timestamp: NSTimeInterval = 1456514091
        
        let date = timestampToDate(timestamp)
        
        print(dateFormatter.stringFromDate(date))
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let timestampString = self.timestampTextField.text {
            
            if let timestamp = Double(timestampString) {
            
                let date = timestampToDate(timestamp)
                self.dateLabel.text = dateFormatter.stringFromDate(date)
                
                self.timestampTextField.resignFirstResponder()
            }
        }
        return true
    }

    
    func timestampFromDate(date: NSDate) -> NSTimeInterval {
        return date.timeIntervalSince1970
    }
    
    func timestampToDate(timestamp: NSTimeInterval) -> NSDate {
        return NSDate(timeIntervalSince1970: timestamp)
    }

}