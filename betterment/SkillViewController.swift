//
//  SkillViewController.swift
//  betterment
//
//  Created by Mitul Manish on 22/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var user: Person?
    var skills: [Skill]?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return user!.skill.count
        
        return user?.getNumberOfSkills() ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
                                                               forIndexPath: indexPath) as? SkillTableViewCell
        // Configure the cell...
        let rate = user!.getSkillsAsArray()[indexPath.row].hourlyRate!
        print(rate)
        cell?.skillImage.image = UIImage(named: (user?.getSkillsAsArray()[indexPath.row].getSkillImageString())!)
        cell?.skillNameLabel.text = user!.getSkillsAsArray()[indexPath.row].skillName
        print(user!.getSkillsAsArray()[indexPath.row].skillName)
        cell?.experienceLabel.text = String(user!.getSkillsAsArray()[indexPath.row].experience!) + " Years"
        cell?.hourlyRateLabel.text = "$  \(user!.getSkillsAsArray()[indexPath.row].hourlyRate!) Per Hour"
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sendRequest" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RequestTableViewController
                
                destinationController.person = self.user
                destinationController.skill = self.skills![indexPath.row]
            }
        }
    }
    
}
