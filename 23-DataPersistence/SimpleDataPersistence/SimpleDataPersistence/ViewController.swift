//
//  ViewController.swift
//  SimpleDataPersistence
//
//  Created by Phil Wright on 3/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var artistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let artist = Artist()
        
        let lastName = Int(arc4random_uniform(10000) + 12)
        
        artist.name = "Phil \(lastName)"
        artist.age = Int(arc4random_uniform(10000) + 20)
        
        let t = Track()
        t.name = "Track One"
        t.age = Int(arc4random_uniform(1000) + 10)
        
        artist.tracksArray.append(t)
        
        let t2 = Track()
        t2.name = "Track Two"
        t2.age = Int(arc4random_uniform(100) + 40)
        
        artist.tracksArray.append(t)
        
        DataStore.sharedInstance.artistsArray.append(artist)

        if DataStore.sharedInstance.saveArtists() {
            print("I saved it")
            artist.debugDump()
        } else {
            print("I couldn't save it")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.sharedInstance.artistsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistCell", forIndexPath: indexPath)
        
        let a = DataStore.sharedInstance.artistsArray[indexPath.row]
        
        cell.textLabel?.text = a.name
        
        return cell
    }



}

