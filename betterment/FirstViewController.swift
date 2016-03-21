//
//  FirstViewController.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var current_user: Person?
    
    var users: [Person] =
    [Person(first_name: "Mitul", last_name: "Manish", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Skill(skill_name: "Photography", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-1.png"),
    Person(first_name: "Ankur", last_name: "Dabral", email: "ankur.dabral@gmail.com", city: "Melbourne", bio: "I know my ABCD", skill: [Skill(skill_name: "Start Up Counselling", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-2.png"),
    Person(first_name: "Praveen", last_name: "Mohan", email: "praveen.mohan@gmail.com", city: "Melbourne", bio: "I know my ABCD.I am the best", skill: [Skill(skill_name: "Video Editing", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-3.png"),
    Person(first_name: "Shal", last_name: "Sajwan", email: "shal.sajwan@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Dancing", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-5.png"),
    Person(first_name: "Bijin", last_name: "Abraham", email: "bijin.abraham@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Career Advice", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "man.png"),
    Person(first_name: "John", last_name: "Abraham", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Fitness Training", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-5.png"),
    Person(first_name: "Rohan", last_name: "Singh", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Sports Guidance", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-6.png"),
    Person(first_name: "Jamie", last_name: "Shaw", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Python Programming", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-1.png"),
    Person(first_name: "Ram", last_name: "Rahim", email: "mitul.manish@gmail.com", city: "Melbourne", bio: "anything", skill: [Skill(skill_name: "Philosophy", hourly_rate: 56.87, experience: 5)], work: [Work(title: "some random title", description: "desc", related_skill: "Photography", images: ["cutmypic.png"])], profile_image: "people-2.png")]
    
    
    // self.performSegueWithIdentifier("showShop", sender: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(users.first?.skill.first?.skill_name)
     
        //FIREBASE_REF.setValue("Do you have data? You'll love Firebase.")
        print ("-------UID-----------")
        let str: String = (NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String)!
        print(str)
         print ("------------------")
        print ("-------current user-----------")
        print(CURRENT_USER.authData.uid)
        print ("------------------")
        // find current user and save it in a variable
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        // Return the number of rows in the section.
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
        forIndexPath: indexPath) as? MasterTableViewCell
        // Configure the cell...
        cell?.nameLabel.text = users[indexPath.row].fullName()
        cell?.locationLabel.text = users[indexPath.row].city
        cell?.skillLabel.text = users[indexPath.row].skill.first?.skill_name
            cell?.thumbnailImageView.image = UIImage(named: users[indexPath.row].profile_image)
        //cell.imageView?.image = UIImage(named: users[indexPath.row].profile_image)
        return cell!
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
        if let indexPath = tableView.indexPathForSelectedRow {
        let destinationController = segue.destinationViewController as!
        DetailTableViewController
        destinationController.person = users[indexPath.row]
        }
        }
    }


}

