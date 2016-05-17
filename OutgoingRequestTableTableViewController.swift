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
}
