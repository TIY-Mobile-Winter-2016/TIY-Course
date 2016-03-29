//
//  ViewController.swift
//  IndexTableView
//
//  Created by Phil Wright on 3/29/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let animals = ["Bear", "Black Swan", "Buffalo", "Camel", "Cockatoo", "Dog", "Donkey", "Emu", "Giraffe", "Greater Rhea", "Hippopotamus", "Horse", "Koala", "Lion", "Llama", "Manatus", "Meerkat", "Panda", "Peacock", "Pig", "Platypus", "Polar Bear", "Rhinoceros", "Seagull", "Tasmania Devil", "Whale", "Whale Shark", "Wombat"]
    
    var animalsDict = [String: [String]]()
    
    var animalSectionTitles = [String]()
    
    let animalIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAnimalDict()
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return animalSectionTitles.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let animalKey = animalSectionTitles[section]
        
        if let animalValues = animalsDict[animalKey] {
            return animalValues.count
        }
        
        return 0
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let animalKey = animalSectionTitles[indexPath.section]
        
        if let animalValues = animalsDict[animalKey] {
            cell.textLabel?.text = animalValues[indexPath.row]
            
            // Convert the animal name to lower case and
            // then replace all occurrences of a space with an underscore
            let imageFilename = animalValues[indexPath.row].lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "_", options: [], range: nil)
            cell.imageView?.image = UIImage(named: imageFilename)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let animalKey = animalSectionTitles[indexPath.section]
        
        if let animalValues = animalsDict[animalKey] {
            print(animalValues)
        }

    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return animalIndexTitles
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        guard let index = animalSectionTitles.indexOf(title) else {
            return -1
        }
        
        return index
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    // MARK: - Sort method
    
    func createAnimalDict() {
        
        for animal in animals {
            
            // Get the first letter of the animal name and build the dictionary
            let animalKey = animal.substringToIndex(animal.startIndex.advancedBy(1))
            
            if var animalValues = animalsDict[animalKey] {
                
                animalValues.append(animal)
                animalsDict[animalKey] = animalValues
            } else {
                
                animalsDict[animalKey] = [animal]
            }
        }
        
        // Get the section titles from the dictionary's keys and sort them in ascending order
        animalSectionTitles = [String](animalsDict.keys)
        animalSectionTitles = animalSectionTitles.sort { $0 < $1 }
    }
}

