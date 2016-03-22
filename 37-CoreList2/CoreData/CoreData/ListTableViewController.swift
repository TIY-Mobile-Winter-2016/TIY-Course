//
//  ListTableViewController.swift
//  CoreData
//
//  Created by Mac Bellingrath on 10/18/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController {
    
    
    var items = [NSManagedObject]()
    
    
    
    var managedObjectContext: NSManagedObjectContext? {
        if let appdelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            return appdelegate.managedObjectContext
        }
        return nil
    }
    
    @IBOutlet var listTableView: UITableView!

    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        
        let ac = UIAlertController(title: "Add", message: "Add a new item", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (alertAction) -> Void in
            
            if let textField = ac.textFields?.first, let text = textField.text {
                self.saveItemName(text)
                self.listTableView.reloadData()
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alertAction) -> Void in
            
        }
        
        ac.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
        }
        ac.addAction(saveAction)
        ac.addAction(cancelAction)
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func fetch() {
        let fetchRequest = NSFetchRequest(entityName: "Item")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
       
        do {
            if let moc = managedObjectContext {
                if let fetchResults = try moc.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                    items = fetchResults
                }
            }
            
        } catch {
            print("Error: \(error)")
        }

    }
    
    
    func saveItemName(itemName: String) {
        
        //
        if let moc = managedObjectContext {
            
            // 
            if let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: moc) {
            
            let item = NSManagedObject(entity: entity, insertIntoManagedObjectContext: moc)
                //
                item.setValue(itemName, forKey: "name")

                //
                do {
                    try moc.save()
            
                    items.append(item)
                    
                } catch {
                    
                    print("Failed to save \(item). Error: \(error)")
                    
                }
            }
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //app delegate
        
        if let moc = managedObjectContext {
            //fetch request
            let fetchRequest  = NSFetchRequest(entityName: "Item")
            
            //
            do {
                
                let results = try moc.executeFetchRequest(fetchRequest)
              
                if let itemResults = results as? [NSManagedObject] {
                    
                    items = itemResults
                   
                    }
                
                }  catch {
                    
                print("Fetch Error: \(error)")
            }

        }
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let item = items[indexPath.row]
        
        if let itemName = item.valueForKey("name") as? String {
            cell.textLabel?.text = itemName
        }
        
     
        
        return cell
    }
    
    
    

       override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

       override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let itemToDelete = items[indexPath.row]
           
            if let moc = managedObjectContext {
                
                moc.deleteObject(itemToDelete)
                
            }
            self.fetch()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
