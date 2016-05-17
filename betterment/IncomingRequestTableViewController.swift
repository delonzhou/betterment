//
//  IncomingRequestTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 8/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class IncomingRequestTableViewController: UITableViewController {
    
    var requests: [Request]?
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        readRequestAndUpdateUI()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
        return requests!.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! IncomingRequestTableViewCell
        
        cell.skillName.text = requests![indexPath.row].skillName
        cell.moneyOffered.text = "$ \(requests![indexPath.row].proposedRate!.stringValue)"
        cell.thumbnailImageView.image = UIImage(named: requests![indexPath.row].getRequestImageString())

        return cell
    }
    
    
    
    func readRequestAndUpdateUI(){
        
        let fetchRequest = NSFetchRequest(entityName: "Request")
    
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "requestee", CURRENT_USER)
        //hard coded string will be replaced with the CURRENT_USER after testing completes.
        
        do {
            let results = try managedObjectContext!.executeFetchRequest(fetchRequest)
            requests = results as? [Request]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailIncomingRequest" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailIncomingViewController
                destinationController.detailRequest = requests?[indexPath.row]
            }
            
        }
    }

}
