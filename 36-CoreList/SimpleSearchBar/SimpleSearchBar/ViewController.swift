//
//  ViewController.swift
//  SimpleSearchBar
//
//  Created by Phil Wright on 3/21/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var citiesArray = [
        "Salt Lake City",
        "Cedar City",
        "St. George",
        "Logan",
        "Price",
        "Enoch",
        "Lehi"]
    
    var searchResults = [String]()
    
    var searchActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
        searchActive = true;
        
        print("didBegin")
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchActive = false;
        
        print("didEnd")
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        searchActive = false;
        
        print("didCancel")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchActive = false;
        
        print("didClick")
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        print("searching...")
        
        filterContentForSearchText(searchText)
        
        if(searchResults.count == 0) {
            
            searchActive = false;
        } else {
            
            searchActive = true;
        }
        
        self.tableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        
        searchResults = citiesArray.filter({
            
            (city:String) -> Bool in
            
            let nameMatch = city.rangeOfString(searchText, options:.CaseInsensitiveSearch)
            
            return nameMatch != nil
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchActive) {
            return searchResults.count
        }
        return citiesArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        if(searchActive) {
            cell.textLabel?.text = searchResults[indexPath.row]
        } else {
            cell.textLabel?.text = citiesArray[indexPath.row];
        }
        return cell;
    }
    
}

