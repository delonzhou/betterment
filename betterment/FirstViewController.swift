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

class FirstViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating{
    
    @IBOutlet weak var tableView: UITableView!
    var current_user: Person?
    
    var users: [Person]? = []
    var currentUserSet: [Person]? = []
    
    var searchController: UISearchController!
    
    var searchResults:[Person] = []
    
    
    // self.performSegueWithIdentifier("showShop", sender: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.tintColor = UIColor.whiteColor()
        searchController?.searchBar.barTintColor = UIColor(red: 189.0/255, green: 195.0/255, blue: 199.0/255, alpha: 1.0)

        //searchController?.searchBar.searchBarStyle = .Minimal
        tableView.tableHeaderView = searchController?.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        users = [Person(user_id: "cb3cccd9-546a-444b-bffe-1e3a5128876c", first_name: "Matt", last_name: "Murdoch", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Skill(skill_name: "Photography", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Dancing", hourly_rate: 56.87, experience: 3),Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Programming", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["fiveleaves.png"]), Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"]),Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["donostia.png"]), Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["haighschocolate.png"])], profile_image: "man-a.png", address: ""),
                 
                 Person(user_id: "0178764a-72e2-4931-b344-9c62e842e7ae",first_name: "Sarah", last_name: "Jane", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Programming", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "woman-d.png", address: ""),
                 
                 Person(user_id: "a04a0b0e-e7ad-467d-976d-4083485f209e",first_name: "Jerry", last_name: "Noel", email: "jerry.noel@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Skill(skill_name: "Start Up Counselling", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-b.png", address: ""),
                 
                 Person(user_id: "890ad8f2-19e8-4b21-b248-e1d56f3f777a",first_name: "Danny", last_name: "Boyle", email: "danny.boyle@gmail.com", city: "Melbourne", bio: "I know my ABCD.", skill: [Skill(skill_name: "Editing", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-c.png", address: ""),
                 
                 Person(user_id: "f1db619b-a444-46ef-96e3-1817fec4e1aa",first_name: "Daniel", last_name: "Murphy", email: "daniel.murphy@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Dancing", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Editing", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Photography", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-d.png", address: ""),
                 
                 Person(user_id: "830107fb-51cb-404d-93f5-ce717ba7c056",first_name: "Ben", last_name: "Abraham", email: "ben.abraham@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-e.png", address: ""),
                 
                 Person(user_id: "c531570d-28a8-4967-bb94-f18b4e7545fa",first_name: "John", last_name: "Doe", email: "john.doe@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "man-f.png", address: ""),
                 
                 Person(user_id: "62d7af73-4daf-4690-94b0-575b17db59e5",first_name: "Tom", last_name: "Legrice", email: "tom.legriceh@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-g.png", address: ""),
                 
                 Person(user_id: "566f9271-3037-4aaf-bee1-e472cf7b51f5",first_name: "Alexandra", last_name: "Shaw", email: "alexandra.shaw@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Programming", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "woman-b.png", address: ""),
                 
                 Person(user_id: "d0923080-7c8b-4601-ad48-d42fa46dd7eb",first_name: "Jennifer", last_name: "Stevens", email: "jennifer.stevens@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Editing", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "woman-a.png", address: "")]
        
        if let indexCurrentUser = findUserIndex(users!){
            users?.removeAtIndex(indexCurrentUser)
        }
       

        let str: String = (NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String)!
        print(str)
        print(NSUserDefaults.standardUserDefaults().valueForKey("uid"))
        print ("------------------")
        print ("-------current user-----------")
        print(CURRENT_USER.authData.uid)
        print ("------------------")
        print(Realm.Configuration.defaultConfiguration.path!)
        // find current user and save it in a variable
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        // Return the number of rows in the section.
        if searchController!.active {
            return searchResults.count
        } else {
            return users!.count
        }
        //return users!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
        forIndexPath: indexPath) as? MasterTableViewCell
        // Configure the cell...
        
        let person = (searchController.active) ? searchResults[indexPath.row] :
            users?[indexPath.row]
        
        if let personName = person?.fullName() {
            cell?.nameLabel.text = personName
        }
        
        if let personCity = person?.city {
            cell?.locationLabel.text = personCity
        }
        
        
        if let skillName = person?.skill.first?.skillName {
            cell?.skillLabel.text = skillName
        }
        
        
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
        if let newSkillViewController = segue.sourceViewController as?
            SaveNewSkillTableViewController {
            
            if let skill_name = newSkillViewController.skill?.skillName {
                print(skill_name)
            }
        }
    }
    
    @IBAction func backtoListViewFromWorkView(segue:UIStoryboardSegue) {
        print(segue.identifier)
        print(segue.sourceViewController)
        if let workController = segue.sourceViewController as? NewWorkTableViewController {
            if let workTitle = workController.work?.title{
                print(workTitle)
            }
        }
    }
    
    private func findUserIndex(userList: [Person]) -> Int? {
        var index = 0
        for user in userList{
            if user.userID == CURRENT_USER.authData.uid{
                return index
            }
        index += 1
        }
        return nil
    }
    
    func updateSearchResultsForSearchController(searchController:
        UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = users!.filter({ (person:Person) -> Bool in
            let nameMatch = person.fullName().rangeOfString(searchText, options:
                NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil
        })
    }
}



