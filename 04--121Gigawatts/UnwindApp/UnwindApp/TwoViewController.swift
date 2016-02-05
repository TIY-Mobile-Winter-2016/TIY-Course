//
//  TwoViewController.swift
//  UnwindApp
//
//  Created by Phil Wright on 2/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func unwindToTwoViewController(segue: UIStoryboardSegue) {
        print("unwindToOneViewController")
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        print("prepareForSegue in TwoViewController called ---  identifier: \(segue.identifier)")
        
    }


}
