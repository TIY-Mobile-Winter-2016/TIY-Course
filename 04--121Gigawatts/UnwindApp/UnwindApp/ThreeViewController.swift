//
//  ThreeViewController.swift
//  UnwindApp
//
//  Created by Phil Wright on 2/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
                print("identifier: \(segue.identifier)")
        
        
    }

}
