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
    
    
    var work: [Work]?

    override func viewDidLoad() { 
        super.viewDidLoad()
        print(work?.first?.title)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        // Return the number of rows in the section.
        return (self.work?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
        forIndexPath: indexPath) as? WorkTableViewCell
        // Configure the cell...
        cell?.titleLabel.text = self.work![indexPath.row].title
        cell?.descriptionLabel.text = self.work![indexPath.row].description
        cell?.workImageView.image = UIImage(named: self.work![indexPath.row].images.first!)
        
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
