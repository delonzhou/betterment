//
//  SaveNewSkillTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 7/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class SaveNewSkillTableViewController: UITableViewController {
    
    var skill: Skill?
    
    @IBOutlet weak var skillName: UITextField!
    
    @IBOutlet weak var hourlyRate: UITextField!
    
    @IBOutlet weak var experience: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func saveNewSkill(sender: UIBarButtonItem) {
        
        print("Button pressed")
        print(self.skillName.text)
        self.skill = Skill(skill_name: self.skillName.text!, hourly_rate: 88.09, experience: 10)
        performSegueWithIdentifier("saveSkill", sender: sender)
    }

}
