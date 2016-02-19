//
//  ThreeViewController.swift
//  NavigationApp
//
//  Created by Phil Wright on 2/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    
    var currentRestaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print(currentRestaurant?.name)
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            print("prepareForSegue called: \(segue.identifier)")
    }

}
