//
//  SettingsTableViewController.swift
//  DudeTabApp
//
//  Created by Phil Wright on 2/16/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        
        let customGreenColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 0.8)
        
        
        headerView.backgroundColor = customGreenColor

        self.tableView.tableHeaderView = headerView
        
        headerView.hidden = true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableOneCell", forIndexPath: indexPath) as! ColorTableViewCell

        return cell
    }

    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180
    }


}
