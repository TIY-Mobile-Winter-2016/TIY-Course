//
//  ViewController.swift
//  Swift-Counter
//
//  Created by Ben Gohlke on 8/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // The following variables and constants are called properties; they hold values that can be accessed from any method in this class
    
    // This allows the app to set its current count when the app first loads.
    // The line below simply generates a random number and then makes sure it falls within the bounds 1-100.
    var currentCount: Int = Int(arc4random() % 100)
    
    // These are called IBOutlets and are a kind of property; they connect elements in the storyboard with the code so you can update the UI elements from code.
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //
        // 1. Once the currentCount variable is set, each of the UI elements on the screen need to be updated to match the currentCount.
        //    There is a method below that performs these steps. All you need to do perform a method call in the line below.
        //
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewsWithCurrentCount()
    {
        // Here we are updating the different subviews in our main view with the current count.
        
        //
        // 2. The textfield needs to always show the current count. Fill in the blank below to set the text value of the textfield.
        //
        countTextField.text = "\(<#What goes here?#>)"
        
        //
        // 3. Here we are setting the value property of the UISlider in the view. This causes the slider to set its handle to the
        //    appropriate position. Fill in the blank below.
        //
        slider.value = <#How about here?#>
        
        //
        // 4. We also need to update the value of the UIStepper. The user will not see any change to the stepper, but it needs to have a
        //    current value nonetheless, so when + or - is tapped, it will know what value to increment. Fill in the blanks below.
        //
        stepper.<#What are we setting?#> = <#variable name#>
    }
    
    // MARK: - Gesture recognizers
    
    @IBAction func viewTapped(sender: UITapGestureRecognizer)
    {
        // This method is run whenever the user taps on the blank, white view (meaning they haven't tapped any of the controls on the
        // view). It hides the keyboard if the user has edited the count textfield, and also updates the currentCount variable.
        if countTextField.isFirstResponder()
        {
            countTextField.resignFirstResponder()
            //
            // 8. Hopefully you're seeing a pattern here. After we update the currentCount variable, what do we need to do next? Fill in
            //    the blank below.
            //
            <#What goes here?#>
        }
    }
    
    // MARK: - Action handlers
    
    @IBAction func sliderValueChanged(sender: UISlider)
    {
        //
        // 5. This method will run whenever the value of the slider is changed by the user. The "sender" object passed in as an argument
        //    to this method represents the slider from the view. We need to take the value of the slider and use it to update the
        //    value of our "currentCount" instance variable. Fill in the blank below.
        //
        currentCount = sender.<#What property should we use here to set our current count?#>
        
        //
        // 6. Once we update the value of currentCount, we need to make sure all the UI elements on the screen are updated to keep
        //    everything in sync. We have previously done this (look in viewDidLoad). Fill in the blank below.
        //
        <#What instruction should go here?#>
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper)
    {
        //
        // 7. This method is run when the value of the stepper is changed by the user. If you've done steps 5 and 6 already, these steps
        //    should look pretty familiar, hint, hint. ;) Fill in the blanks below.
        //
        currentCount = <#What goes here?#>
        <#How about here?#>
    }
}