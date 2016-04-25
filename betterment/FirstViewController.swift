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

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var current_user: Person?
    
    var users: [Person]? = []
    
    
    
    // self.performSegueWithIdentifier("showShop", sender: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = [Person(user_id: "cb3cccd9-546a-444b-bffe-1e3a5128876c", first_name: "Matt", last_name: "Murdoch", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Skill(skill_name: "Photography", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Dancing", hourly_rate: 56.87, experience: 3),Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Programming", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["fiveleaves.png"]), Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"]),Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["donostia.png"]), Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["haighschocolate.png"])], profile_image: "man-a.png", address: ""),
                 
                 Person(user_id: "0178764a-72e2-4931-b344-9c62e842e7ae",first_name: "Sarah", last_name: "Jane", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Programming", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "woman-d.png", address: ""),
                 
                 Person(user_id: "",first_name: "Jerry", last_name: "Noel", email: "ankur.dabral@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Skill(skill_name: "Start Up Counselling", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-b.png", address: ""),
                 
                 Person(user_id: "",first_name: "Danny", last_name: "Boyle", email: "praveen.mohan@gmail.com", city: "Melbourne", bio: "I know my ABCD.", skill: [Skill(skill_name: "Editing", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-c.png", address: ""),
                 
                 Person(user_id: "",first_name: "Daniel", last_name: "Murphy", email: "shal.sajwan@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Dancing", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Editing", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Photography", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-d.png", address: ""),
                 
                 Person(user_id: "",first_name: "Ben", last_name: "Abraham", email: "bijin.abraham@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-e.png", address: ""),
                 
                 Person(user_id: "",first_name: "John", last_name: "Doe", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "man-f.png", address: ""),
                 
                 Person(user_id: "",first_name: "Tom", last_name: "Legrice", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "man-g.png", address: ""),
                 
                 Person(user_id: "",first_name: "Alexandra", last_name: "Shaw", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Programming", hourly_rate: 56.87, experience: 5),Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "woman-b.png", address: ""),
                 
                 Person(user_id: "",first_name: "Jennifer", last_name: "Stevens", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5), Skill(skill_name: "Editing", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["thaicafe.png"])], profile_image: "woman-a.png", address: "")]
        // Do any additional setup after loading the view, typically from a nib.
        //print(users.first?.skill.first?.skill_name)
     
        //FIREBASE_REF.setValue("Do you have data? You'll love Firebase.")
        //print ("-------UID-----------")
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
        return users!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
        forIndexPath: indexPath) as? MasterTableViewCell
        // Configure the cell...
        
        if let personName = users?[indexPath.row].fullName(){
            cell?.nameLabel.text = personName
        }
    

        if let personCity = users?[indexPath.row].city{
            cell?.locationLabel.text = personCity
        }

        
        if let skillName = users?[indexPath.row].skill.first?.skill_name{
            cell?.skillLabel.text = skillName
        }

        
        if let personImage = users?[indexPath.row].profile_image{
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
            destinationController.person = users![indexPath.row]
            }
        }
    }
    
    @IBAction func backToList(segue:UIStoryboardSegue) {
        print(segue.identifier)
        print(segue.sourceViewController)
        if let newSkillViewController = segue.sourceViewController as?
            SaveNewSkillTableViewController {
            
            if let skill_name = newSkillViewController.skill?.skill_name{
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


}

