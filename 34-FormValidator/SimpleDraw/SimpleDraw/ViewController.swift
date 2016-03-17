//
//  ViewController.swift
//  SimpleDraw
//
//  Created by Phil Wright on 3/16/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    var lastPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            self.lastPoint = touch.locationInView(self.imageView)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            let point = touch.locationInView(self.imageView)
            print(point)
        
            UIGraphicsBeginImageContext(self.imageView.frame.size)
        
            let context = UIGraphicsGetCurrentContext()
        
            let frame = imageView.frame
        
            self.imageView.image?.drawInRect(frame)
        
            CGContextMoveToPoint(context, self.lastPoint.x, self.lastPoint.y)
            
            CGContextAddLineToPoint(context, point.x, point.y)
            
            CGContextSetRGBStrokeColor(context, 1, 0, 0, 1)
            
            CGContextSetLineWidth(context, 15.0)
            
            CGContextSetLineCap(context, .Round)
            
            CGContextStrokePath(context)
            
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            self.lastPoint = point
        }
    }

}

