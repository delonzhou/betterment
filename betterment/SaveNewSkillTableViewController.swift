//
//  SaveNewSkillTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 7/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class SaveNewSkillTableViewController: UITableViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
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
        
        DataAccess.sharedInstance.saveNewSkill(skillName.text, hourlyRate: hourlyRate.text, experience: experience.text)
        
        performSegueWithIdentifier("saveSkill", sender: sender)
    }
    
}
