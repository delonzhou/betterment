//
//  FirstViewController.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift
import CoreData

class FirstViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating{
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [Person]? = []
    
    var searchController: UISearchController!
    var searchResults:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch()
        setUpSearchBar()
    }
    
    func fetch(){
        let fetchRequest = NSFetchRequest(entityName: "Person")
        // eliminating the current user from the list
        //fetchRequest.predicate = NSPredicate(format: "%K != %@", "userID", CURRENT_USER)
        
        do {
            let results = try managedObjectContext!.executeFetchRequest(fetchRequest)
            users = results as? [Person]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
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
        
    
        cell?.skillLabel.text = person?.getSkillsAsArray().first?.skillName ?? "N/A"
        
        
        if let personImage = person?.profileImage {
            cell?.thumbnailImageView.image = UIImage(named: personImage)
        }
        
        return cell!
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
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
        print(segue.identifier)
        print(segue.sourceViewController)
    }
    
    @IBAction func backtoListViewFromWorkView(segue:UIStoryboardSegue) {
        print(segue.identifier)
        print(segue.sourceViewController)
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
}



