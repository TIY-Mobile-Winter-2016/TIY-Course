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

class GroceryListTableViewController: UITableViewController {

  // MARK: Constants
  let ListToUsers = "ListToUsers"
  
  // MARK: Properties 
  var items = [GroceryItem]()
  let ref = Firebase(url: "https://grocr-app.firebaseio.com/grocery-items")
  let usersRef = Firebase(url: "https://grocr-app.firebaseio.com/online")
  var user: User!
  var userCountBarButtonItem: UIBarButtonItem!
  
  // MARK: UIViewController Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Set up swipe to delete
    tableView.allowsMultipleSelectionDuringEditing = false
    
    // User Count
    userCountBarButtonItem = UIBarButtonItem(title: "1", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(GroceryListTableViewController.userCountButtonDidTouch))
    userCountBarButtonItem.tintColor = UIColor.whiteColor()
    navigationItem.leftBarButtonItem = userCountBarButtonItem
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    // [1] Call the queryOrderedByChild function to return a reference that queries by the "completed" property
    ref.queryOrderedByChild("completed").observeEventType(.Value, withBlock: { snapshot in
      
      var newItems = [GroceryItem]()
      
      for item in snapshot.children {
        
        let groceryItem = GroceryItem(snapshot: item as! FDataSnapshot)
        newItems.append(groceryItem)
      }
      
      self.items = newItems
      self.tableView.reloadData()
    })
    
    ref.observeAuthEventWithBlock { authData in
      
      if authData != nil {
        
        self.user = User(authData: authData)
        
        // Create a child reference with a unique id
        let currentUserRef = self.usersRef.childByAutoId()
        
        // Save the current user to the online users list
        currentUserRef.setValue(self.user.email)
        
        // When the user disconnects remove the value
        currentUserRef.onDisconnectRemoveValue()
      }
      
    }
    
    // Create a value observer
    usersRef.observeEventType(.Value, withBlock: { (snapshot: FDataSnapshot!) in
      
      // Check to see if the snapshot has any data
      if snapshot.exists() {
        
        // Get the number of online users from the childrenCount property
        self.userCountBarButtonItem?.title = snapshot.childrenCount.description
      } else {
        self.userCountBarButtonItem?.title = "0"
      }
    })
    
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    
  }
  
  // MARK: UITableView Delegate methods
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
    let groceryItem = items[indexPath.row]
    
    cell.textLabel?.text = groceryItem.name
    cell.detailTextLabel?.text = groceryItem.addedByUser
    
    // Determine whether the cell is checked
    toggleCellCheckbox(cell, isCompleted: groceryItem.completed)
    
    return cell
  }
  
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {

      // Find the snapshot and remove the value
      let groceryItem = items[indexPath.row]
      
      // Using the optional ref property, remove the value from the database
      groceryItem.ref?.removeValue()
      
    }
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // Get the cell
    let cell = tableView.cellForRowAtIndexPath(indexPath)!
    
    // Get the associated grocery item
    var groceryItem = items[indexPath.row]
    
    // Get the new completion status
    let toggledCompletion = !groceryItem.completed
    
    // Determine whether the cell is checked and modify it's view properties
    toggleCellCheckbox(cell, isCompleted: toggledCompletion)
    
    // Call updateChildValues on the grocery item's reference with just the new completed status
    groceryItem.ref?.updateChildValues([
      "completed": toggledCompletion
      ])
  }
  
  func toggleCellCheckbox(cell: UITableViewCell, isCompleted: Bool) {
    if !isCompleted {
      cell.accessoryType = UITableViewCellAccessoryType.None
      cell.textLabel?.textColor = UIColor.blackColor()
      cell.detailTextLabel?.textColor = UIColor.blackColor()
    } else {
      cell.accessoryType = UITableViewCellAccessoryType.Checkmark
      cell.textLabel?.textColor = UIColor.grayColor()
      cell.detailTextLabel?.textColor = UIColor.grayColor()
    }
  }
  
  // MARK: Add Item
  
  @IBAction func addButtonDidTouch(sender: AnyObject) {
    // Alert View for input
    let alert = UIAlertController(title: "Grocery Item", message: "Add an Item", preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
        
        // Get the text field for the item name
        let textField = alert.textFields![0]
        
        if let theText = textField.text {
            // Create the grocery item from the struct
            let groceryItem = GroceryItem(name: theText, addedByUser: self.user.email, completed: false)
        
            // Create a child id from the item's name as a lowercase string
            let groceryItemRef = self.ref.childByAppendingPath(theText.lowercaseString)
        
            // Save the grocery items in its AnyObject form
            groceryItemRef.setValue(groceryItem.toAnyObject())
        }
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
      style: .Default) { (action: UIAlertAction!) -> Void in
    }
    
    alert.addTextFieldWithConfigurationHandler {
      (textField: UITextField!) -> Void in
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(alert,
      animated: true,
      completion: nil)
  }
  
  func userCountButtonDidTouch() {
    performSegueWithIdentifier(ListToUsers, sender: nil)
  }
  
}
