//
//  ViewController.swift
//  StarWarsApp
//
//  Created by Phil Wright on 2/5/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Create task arrays
    let mainCharacters = ["Obi-Wan Kenobi",
        "Darth Vader",
        "Han Solo",
        "Princess Leia",
        "Yoda",
        "Chewbacca"]
    
    let starWarsReturnsCharacters = [
        "Kylo Ren",
        "Rey",
        "General Hux"]
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mainCharacters.count
        case 1:
            return starWarsReturnsCharacters.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var currentCharacter: String
        
        switch indexPath.section {
        case 0:
            currentCharacter = mainCharacters[indexPath.row]
        case 1:
            currentCharacter = starWarsReturnsCharacters[indexPath.row]
        default:
            currentCharacter = ""
        }
        
        cell.textLabel?.text = currentCharacter
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "MAIN CHARACTERS"
        case 1:
            return "STAR WARS RETURNS CHARACTERS"
        default:
            return ""
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected row: \(indexPath.row) in section: \(indexPath.section)")
    }

}

