//
//  ViewController.swift
//  SimpleScrollView
//
//  Created by Phil Wright on 12/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var framesView: UIView!
    
    @IBOutlet weak var framesScrollView: UIScrollView!
    
    /* Frame Buttons */
    var frameTag = 0
    var frameButtons: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        // Variables for setting the Filter Buttons and Labels
        var xCoord: CGFloat = 0
        let yCoord: CGFloat = 10
        let buttonWidth:CGFloat = 100
        let buttonHeight: CGFloat = 100
        let gapBetweenButtons: CGFloat = 5
        
        // Counter
        var framesCount = 0
        
        for framesCount = 0; framesCount < 9; ++framesCount {
            frameTag = framesCount
            let framesImageStr:String = "f\(frameTag)"
            
            // Create a Button for each Frame ==========
            frameButtons = UIButton(type: UIButtonType.Custom)
            frameButtons?.frame = CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)
            frameButtons?.tag = frameTag
            frameButtons?.showsTouchWhenHighlighted = true
            frameButtons?.setBackgroundImage(UIImage (named: framesImageStr), forState: UIControlState.Normal)
            frameButtons?.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            
            // Add Buttons & Labels based on xCood
            xCoord +=  buttonWidth + gapBetweenButtons
            framesScrollView.addSubview(frameButtons!)
        }
        
        // Place Buttons into the Frames ScrollView =====
        framesScrollView.contentSize = CGSizeMake(buttonWidth * CGFloat(framesCount+1), yCoord)
        
        print(framesScrollView.contentSize)
    }
    
    func buttonTapped(sender: UIButton) {
        print("buttonTapped")
    }

}

