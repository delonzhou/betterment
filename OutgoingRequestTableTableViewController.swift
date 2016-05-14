//
//  IncomingRequestTableTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 10/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class OutgoingRequestTableTableViewController: UITableViewController {
    
    var outgoingRequests: [Request]?
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print("fetching")
        fetchOutGoingRequestUpdateUI()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func fetchOutGoingRequestUpdateUI() {
        
        let fetchRequest = NSFetchRequest(entityName: "Request")
        
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "requester", CURRENT_USER)
        //hard coded string will be replaced with the CURRENT_USER after testing completes.
        
        do {
            let results = try managedObjectContext!.executeFetchRequest(fetchRequest)
            outgoingRequests = results as? [Request]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        for request in outgoingRequests!{
            print(request.skillName)
            print(request.requestee)
            print(request.requester)
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return outgoingRequests!.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! OutgoingRequestTableViewCell
        
        cell.skillName.text = outgoingRequests![indexPath.row].skillName
        cell.moneyOffering.text = "$ \(outgoingRequests![indexPath.row].proposedRate!.stringValue)"
        cell.thumbnailImageView.image = UIImage(named: outgoingRequests![indexPath.row].getRequestImageString())

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailOutgoingRequest" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailOutgoingViewController
                destinationController.detailRequest = outgoingRequests?[indexPath.row]
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
