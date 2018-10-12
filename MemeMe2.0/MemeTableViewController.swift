//
//  UITableViewController.swift
//  Experiment1
//
//  Created by Pete Chambers on 07/12/2017.
//  Copyright © 2017 Pete Chambers. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController {

    var memes: [Meme]! {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.memes
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the image and label
        let topMemeText = meme.topText
        let bottomMemeText = meme.bottomText
        let cellText = topMemeText + " " + bottomMemeText
        cell.textLabel?.text = cellText
        
        cell.imageView?.image = meme.memedImage
        
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(detailController, animated: true)
    }
}
