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
        
        print("finding User")
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", CURRENT_USER)
        
        //3
        var fetchedUsers = [Person]()
        do {
            let results =
                try managedObjectContext!.executeFetchRequest(fetchRequest)
            fetchedUsers = (results as?[
                Person])!
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let associatedUser = fetchedUsers.first
        
        print("User found")
        
        let skillEntity = NSEntityDescription.insertNewObjectForEntityForName("Skill", inManagedObjectContext: managedObjectContext!) as! Skill
        
        skillEntity.setValue(skillName.text, forKey: "skillName")
        
        let hourlyRateInput = hourlyRate.text
        if let number = Int(hourlyRateInput!) {
            let myNumber = NSNumber(integer: number)
            skillEntity.setValue(myNumber, forKey: "hourlyRate")
        } else {
            print("'\(hourlyRateInput)' did not convert to an Int")
        }
        
        let experienceInput = experience.text
        if let number = Int(experienceInput!) {
            let myNumber = NSNumber(integer: number)
            skillEntity.setValue(myNumber, forKey: "experience")
        } else {
            print("'\(experienceInput)' did not convert to an Int")
        }
        
        skillEntity.owner = associatedUser
        
        print("Saving Skill")
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        print("Done Saving Skill")
        performSegueWithIdentifier("saveSkill", sender: sender)
    }
    
}
