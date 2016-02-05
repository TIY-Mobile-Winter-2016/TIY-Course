//
//  OneViewController.swift
//  UnwindApp
//
//  Created by Phil Wright on 2/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func unwindToOneViewController(segue: UIStoryboardSegue) {
        print("unwindToOneViewController")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("prepareForSegue in OneViewController called ---  identifier: \(segue.identifier)")
        
        
    }
    

}

