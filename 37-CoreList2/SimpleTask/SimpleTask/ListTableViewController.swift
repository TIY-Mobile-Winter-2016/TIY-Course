//
//  ListTableViewController.swift
//  SimpleTask
//
//  Created by Phil Wright on 3/22/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController {
    
    var tasksArray = [NSManagedObject]()
    
    let moc = DataController().managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let fetchRequest  = NSFetchRequest(entityName: "Task")
        
        do {
            
            let results = try moc.executeFetchRequest(fetchRequest)
            
            if let results = results as? [NSManagedObject] {
                
                tasksArray = results
                
            }
            
        }  catch {
            
            print("Fetch Error: \(error)")
        }
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        
        let ac = UIAlertController(title: "Add", message: "Add a new task", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) {
            (alertAction) -> Void in
            
            if let textField = ac.textFields?.first,
                let name = textField.text {
                    self.saveTask(name)
                    self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            (alertAction) -> Void in
            
        }
        
        ac.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
        }
        
        ac.addAction(saveAction)
        
        ac.addAction(cancelAction)
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func fetch() {
        
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            if let fetchResults = try moc.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                tasksArray = fetchResults
            }
            
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    
    func saveTask(name: String) {
        
        if let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: moc) {
            
            let task = NSManagedObject(entity: entity, insertIntoManagedObjectContext: moc)
            
            task.setValue(name, forKey: "name")
            
            do {
                try moc.save()
                tasksArray.append(task)
            } catch {
                print("Failed to save \(task). Error: \(error)")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tasksArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
        
        let item = self.tasksArray[indexPath.row]
        
        if let name = item.valueForKey("name") as? String {
            cell.textLabel?.text = name
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            
            let taskToDelete = tasksArray[indexPath.row]
            moc.deleteObject(taskToDelete)
            
            // Fetch Data Again
            self.fetch()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}