//
//  ViewController.swift
//  ImageFromURLApp
//
//  Created by Phil Wright on 2/24/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadImageFromURL("https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")
        
    }
    
    func loadImageFromURL(urlString: String) {
        
        if urlString.isEmpty == false {
        
            dispatch_async(dispatch_get_main_queue(), {
                if let url = NSURL(string: urlString) {
                    if let data = NSData(contentsOfURL: url) {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            })
        } else {
            debugPrint("Invalid \(urlString)")
        }
    }
    
}

