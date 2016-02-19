//
//  ViewController.swift
//  NavigationApp
//
//  Created by Phil Wright on 2/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var currentRestaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentRestaurant = Restaurant()
        currentRestaurant?.name = "HomeController"
        
    }
    
    @IBAction func goButtonTapped(sender: UIButton) {
        self.performSegueWithIdentifier("showOneController", sender: currentRestaurant)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("prepareForSegue called: \(segue.identifier)")
        
        if segue.identifier == "showOneController" {
            let destinationController = segue.destinationViewController as? OneViewController
            
            if let restaurant = sender as? Restaurant {
                destinationController?.currentRestaurant = restaurant
            } else {
                print("sender was not a restaurant")
            }
            
        } else {
            print("No segue identifier")
        }
        
    }


    
    


}

