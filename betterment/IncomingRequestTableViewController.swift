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
        print("************")
        print(CURRENT_USER)
        print("************")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
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
        
        //cell.textLabel?.text = requests![indexPath.row].skillName
        //cell.imageView?.image = UIImage(named: requests![indexPath.row].getRequestImageString())
        
        // Configure the cell...

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
        
        for request in requests!{
            print("************")
            print(request.accepted)
            print("************")
        }
        self.tableView.reloadData()
    }
    
    func updateValue(request: Request){
        
        //let entity = NSEntityDescription.insertNewObjectForEntityForName("Request", inManagedObjectContext: //managedObjectContext!) as! Request
        
        request.skillName = "Editing"
        
        
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        
        print("seeding complete ....")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailIncomingRequest" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailIncomingViewController
                destinationController.detailRequest = requests?[indexPath.row]
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
