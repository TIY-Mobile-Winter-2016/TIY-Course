//
//  AlbumListTableViewController.swift
//  AlbumSearch
//
//  Created by Phil Wright on 02/21/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSArray)
}

class AlbumListTableViewController: UITableViewController, APIControllerProtocol
{
    
    var albums = [Album]()
    
    var api: APIController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIController(delegate: self)
        
        api.searchItunesFor("cannibal corpse")
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    // MARK: - TableView Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("AlbumCell", forIndexPath: indexPath)
        
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = album.title
        
        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    // MARK: - API Controller Protocol
    
    func didReceiveAPIResults(results: NSArray) {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.albums = Album.albumsWithJSON(results)
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }

}

