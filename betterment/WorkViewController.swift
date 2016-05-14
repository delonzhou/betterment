//
//  WorkViewController.swift
//  betterment
//
//  Created by Mitul Manish on 23/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var works: [Work]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            // Return the number of rows in the section.
            return (self.works?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
                                                               forIndexPath: indexPath) as? WorkTableViewCell
        // Configure the cell...
        cell?.titleLabel.text = works![indexPath.row].workTitle
        cell?.descriptionLabel.text = works![indexPath.row].workDescription
        cell?.workImageView.image = UIImage(data: works![indexPath.row].workImage!)
        
        return cell!
    }
    
}

