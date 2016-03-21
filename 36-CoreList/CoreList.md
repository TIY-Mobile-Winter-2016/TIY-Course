# CoreList

A simple list that runs off of CoreData. The sample app is built to add items to CoreData and the UITableViewController will fetch all items from CoreData. You will be extending the functionality to update existing items and show the status of the items visually.

## Objectives

After completing this assignment, you should…

* Understand how to work with UISearchBar
* Understand how to run a query on CoreData with NSPredicate

## Normal Mode

* Add a label on the cell to show the created date.
* Change color of cell background based on time since creation [green, yellow > 2m, red > 5m].
* Add a fetch predicate & sort descriptor to order based on creation date (oldest first).
* Make the background grey and text white if the item is completed.
* Tap the cell to toggle item as completed.
 
## Hard Mode

* Add search capabilities to the UITableViewController.
* Query CoreData and pull back items that contain the search value.

## Additional Resources

* Read [Using Predicates](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Predicates/Articles/pUsing.html)
* Sample App [Swift](../projects/CoreList/Swift/CoreList.zip) or [Objective C](../projects/CoreList/ObjC/CoreList.zip)