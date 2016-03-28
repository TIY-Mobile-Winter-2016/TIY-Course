/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import QuartzCore

class LoginViewController: UIViewController {

  // MARK: Constants
  let LoginToList = "LoginToList"
  
  // MARK: Outlets
  @IBOutlet weak var textFieldLoginEmail: UITextField!
  @IBOutlet weak var textFieldLoginPassword: UITextField!
  
  // MARK: Properties
  let ref = Firebase(url: "https://grocr-app.firebaseio.com")
  
  // MARK: UIViewController Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    ref.observeAuthEventWithBlock { (authData) -> Void in
      
      if authData != nil {
        self.performSegueWithIdentifier(self.LoginToList, sender: nil)
      }
      
    }
  }
  
  // MARK: Actions
  @IBAction func loginDidTouch(sender: AnyObject) {
    
    ref.authUser(textFieldLoginEmail.text, password: textFieldLoginPassword.text, withCompletionBlock: { (error, auth) -> Void in
      
    })
    
  }

  @IBAction func signUpDidTouch(sender: AnyObject) {
    var alert = UIAlertController(title: "Register",
      message: "Register",
      preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save",
      style: .Default) { (action: UIAlertAction!) -> Void in
        
        let emailField = alert.textFields![0] as! UITextField
        let passwordField = alert.textFields![1] as! UITextField
      
        self.ref.createUser(emailField.text, password: passwordField.text) { (error: NSError!) in
          
          if error == nil {
            
            self.ref.authUser(emailField.text, password: passwordField.text, withCompletionBlock: { (error, auth) in

            })
          }
        }
      
        
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
      style: .Default) { (action: UIAlertAction!) -> Void in
    }
    
    alert.addTextFieldWithConfigurationHandler {
      (textEmail) -> Void in
      textEmail.placeholder = "Enter your email"
    }
    
    alert.addTextFieldWithConfigurationHandler {
      (textPassword) -> Void in
      textPassword.secureTextEntry = true
      textPassword.placeholder = "Enter your password"
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(alert,
      animated: true,
      completion: nil)
  }

}

