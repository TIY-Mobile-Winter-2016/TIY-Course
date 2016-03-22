
// Step 1
if let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: moc) {

  // Step 2
  let task = NSManagedObject(entity: entity, insertIntoManagedObjectContext: moc)

    // Step 3
    task.setValue(name, forKey: "name")

    // Step 4
    do {
        try moc.save()
        self.tasksArray.append(task)
    } catch {
        print("Failed to save \(task). Error: \(error)")
    }
}
