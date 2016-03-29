//
//  ViewController.swift
//  SimpleAnimation
//
//  Created by Phil Wright on 3/28/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()
    
    var currentAnimation = 0
    
    @IBOutlet weak var tapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup ImageView
        imageView = UIImageView(image: UIImage(named: "grizzly"))
        imageView.center = self.view.center
        
        view.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
    
        UIView.animateWithDuration(5, animations: { 
            // start
            self.imageView.transform = CGAffineTransformMakeScale(0.2, 0.2)
            }) { (animated) in
                
                self.imageView.transform = CGAffineTransformIdentity
        }
        
        
        
        
        
        
    }
    
}

