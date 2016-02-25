//
//  ViewController.swift
//  ImageFromURLApp
//
//  Created by Phil Wright on 2/24/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var imagesArray = [
        "http://images.halloweencostumes.com/products/4049/1-1/big-top-belle-clown-wig.jpg",
        "https://image.tmdb.org/t/p/w185/6vzNCyVNPkcITEMKl3oXnWm8QMs.jpg",
        "https://image.tmdb.org/t/p/w185/cWERd8rgbw7bCMZlwP207HUXxym.jpg",
        "https://image.tmdb.org/t/p/w185/eqFckcHuFCT1FrzLOAvXBb4jHwq.jpg",
        "https://image.tmdb.org/t/p/w185/vgAHvS0bT3fpcpnJqT6uDTUsHTo.jpg"
    ]
    
    var moviesArray = [Movie]()
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        for urlStr in imagesArray {
            let m = Movie()
            m.urlString = urlStr
            m.title = "Rambo"
            
            moviesArray.append(m)
        }
        
        
    }
    
    //MARK: - Delegate Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieTableViewCell
        
        let m = moviesArray[indexPath.row]
        cell?.cellImageView.image = UIImage(named: "greenBackground")
        
        cell?.setTheMovieForCell(m)
        
        return cell!
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}

