//
//  DetailTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 19/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var ratingButton: UIButton!
    
    var rating: String?
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var skillButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailImage: UIImageView!
    
    var person: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.image = UIImage(named: person.profileImage)
        tableView.separatorColor = UIColor(red: 0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? MasterDetailTableViewCell
        
        switch(indexPath.row){
        case 0:
            cell?.fieldLabel.text = "Name"
            cell?.valueLabel.text = self.person.fullName()
        case 1:
            cell?.fieldLabel.text = "Loaction"
            cell?.valueLabel.text = self.person.city
        case 2:
            cell?.fieldLabel.text = "Skill"
            cell?.valueLabel.text = self.person.skill.first?.skillName
        case 3:
            cell?.fieldLabel.text = "Bio"
            cell?.valueLabel.text = self.person.bio
        default:
            cell?.fieldLabel.text = ""
            cell?.valueLabel.text = ""
            
        }
        cell?.backgroundColor = UIColor.clearColor()
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "skills" {
            let skillController = segue.destinationViewController as? SkillViewController
            skillController?.skill = self.person.skill
            skillController?.user = self.person
        }
        else if segue.identifier == "works" {
            let workController = segue.destinationViewController as? WorkViewController
            workController?.work = self.person.work
        }
        else if segue.identifier == "showMap" {
            let mapController = segue.destinationViewController as? mapViewController
            mapController?.person = self.person
        }
        
        else if segue.identifier == "chatSegue" {
            let navVc = segue.destinationViewController as! UINavigationController
            let chatVc = navVc.viewControllers.first as! ChatViewController
            chatVc.senderId = CURRENT_USER.authData.uid
            chatVc.receiverId = self.person.userID
            chatVc.senderDisplayName = self.person.fullName()
        }
            
            
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        if let ratingViewController = segue.sourceViewController as?
            RatingViewController {
            if let rating = ratingViewController.userRating {
                print(rating)
                ratingButton.setImage(UIImage(named: rating), forState:
                    UIControlState.Normal)
            }
        }
    }
}
