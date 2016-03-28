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

class OnlineUsersTableViewController: UITableViewController {

  // MARK: Constants
  let UserCell = "UserCell"
  let usersRef = Firebase(url: "https://grocr-app.firebaseio.com/online")
  
  // MARK: Properties
  var currentUsers: [String] = [String]()
  
  // MARK: UIViewController Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Create a listener for the delta additions to animate new items as they're added
    usersRef.observeEventType(.ChildAdded, withBlock: { (snap: FDataSnapshot!) in
      
      // Add the new user to the local array
      self.currentUsers.append(snap.value as! String)
      
      // Get the index of the current row
      let row = self.currentUsers.count - 1
      
      // Create an NSIndexPath for the row
      let indexPath = NSIndexPath(forRow: row, inSection: 0)
      
      // Insert the row for the table with an animation
      self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
      
    })
    
    // Create a listener for the delta deletions to animate removes from the table view
    usersRef.observeEventType(.ChildRemoved, withBlock: { (snap: FDataSnapshot!) -> Void in
      
      // Get the email to find
      let emailToFind: String! = snap.value as! String
      
      // Loop to find the email in the array
      for(index, email) in self.currentUsers.enumerate() {
        
        // If the email is found, delete it from the table with an animation
        if email == emailToFind {
          let indexPath = NSIndexPath(forRow: index, inSection: 0)
          self.currentUsers.removeAtIndex(index)
          self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
      }
      
    })
    
  }

  // MARK: UITableView Delegate methods
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return currentUsers.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(UserCell, forIndexPath: indexPath)
    let onlineUserEmail = currentUsers[indexPath.row]
    cell.textLabel?.text = onlineUserEmail
    return cell
  }

  
}
