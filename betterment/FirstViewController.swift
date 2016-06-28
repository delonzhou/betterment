//
//  FirstViewController.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class FirstViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
    var fetchResultController:NSFetchedResultsController!
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [Person]? = []
    
    var searchController: UISearchController!
    var searchResults:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Please uncomment the code below while running the app for the
        // first time.This method seeds data into the database.
        
        //DataSeeder.seedData()
        
        fetch()
        setUpSearchBar()
    }
    
    func fetch() {
        let fetchRequest = NSFetchRequest(entityName: "Person")
        let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        //fetchRequest.predicate = NSPredicate(format: "%K != %@", "userID", CURRENT_USER)
        
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                users = fetchResultController.fetchedObjects as? [Person]
            } catch {
                print(error)
            }
        }
    }
    
    func setUpSearchBar(){
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.tintColor = UIColor.whiteColor()
        searchController?.searchBar.barTintColor = UIColor(red: 189.0/255, green: 195.0/255, blue: 199.0/255, alpha: 1.0)
        
        //searchController?.searchBar.searchBarStyle = .Minimal
        tableView.tableHeaderView = searchController?.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            
            if searchController!.active {
                return searchResults.count
            } else {
                return users!.count
            }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
                                                               forIndexPath: indexPath) as? MasterTableViewCell
        // Configure the cell...
        
        let person = (searchController.active) ? searchResults[indexPath.row] :
            users?[indexPath.row]
        
        if let personName = person?.getfullName() {
            cell?.nameLabel.text = personName
        }
        
        if let personCity = person?.city {
            cell?.locationLabel.text = personCity
        }
        
        if let skillName = person?.getSkillsAsArray().first?.skillName {
            cell?.skillLabel.text = skillName.capitalizedString
        }
        else {
            cell?.skillLabel.text = ""
        }
        
        
        if let personImage = person?.profileImage {
            cell?.thumbnailImageView.image = UIImage(named: personImage)
        }
        
        return cell!
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailTableViewController
                destinationController.person = (searchController.active) ? searchResults[indexPath.row] :
                    users?[indexPath.row]
            }
        }
    }
    
    
    @IBAction func backToList(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func backtoListViewFromWorkView(segue:UIStoryboardSegue) {
        
    }
    
    
    func updateSearchResultsForSearchController(searchController:
        UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = users!.filter({ (person: Person) -> Bool in
            let nameMatch = person.getfullName().rangeOfString(searchText, options:
                NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil
        })
    }

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath

    indexPath: NSIndexPath) -> [UITableViewRowAction]? {

        // Social Sharing Button

        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share",
                handler: { (action, indexPath) -> Void in
            let shareActionText = "Thanks for your help \(self.users![indexPath.row].getfullName())"

            if let imageToShare = UIImage(named: self.users![indexPath.row].profileImage!) {

                let activityController = UIActivityViewController(activityItems:

                [shareActionText, imageToShare], applicationActivities: nil)

                self.presentViewController(activityController, animated: true,

                        completion: nil)

            }

        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the database
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
                
                let personToDelete = self.fetchResultController.objectAtIndexPath(indexPath) as! Person
                managedObjectContext.deleteObject(personToDelete)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
            }
        })
        
        deleteAction.backgroundColor = UIColor(red: 207.0/255.0, green: 0.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        shareAction.backgroundColor = UIColor(red: 135.0/255.0, green: 211.0/255.0, blue: 124.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            users?.removeAtIndex(indexPath.row)
        }
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
            
        default:
            tableView.reloadData()
        }
        
        users = controller.fetchedObjects as? [Person]
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
}



