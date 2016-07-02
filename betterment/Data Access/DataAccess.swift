//
// Created by Mitul Manish on 3/07/2016.
// Copyright (c) 2016 Mitul Manish. All rights reserved.
//

import Foundation
import CoreData

class DataAccess {
    
    let managedObjectContext: NSManagedObjectContext?
    
    static let sharedInstance = DataAccess()
    private init() {
        managedObjectContext =  (UIApplication.sharedApplication().delegate as?
            AppDelegate)?.managedObjectContext
    } //This prevents others from using the default '()' initializer for this class.
    
    func saveNewSkill(skillName: String?, hourlyRate: String?, experience: String?) {
        print("finding User")
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", CURRENT_USER!)
        
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
        
        if let skillName = skillName {
            skillEntity.setValue(skillName, forKey: "skillName")
        }
        
        if let hourlyRateInput = hourlyRate {
            if let number = Int(hourlyRateInput) {
                let myNumber = NSNumber(integer: number)
                skillEntity.setValue(myNumber, forKey: "hourlyRate")
            } else {
                print("'\(hourlyRateInput)' did not convert to an Int")
            }
        }
        
        
        if let experienceInput = experience {
            if let number = Int(experienceInput) {
                let myNumber = NSNumber(integer: number)
                skillEntity.setValue(myNumber, forKey: "experience")
            } else {
                print("'\(experienceInput)' did not convert to an Int")
            }
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
    }
    
    func saveNewWorkItem(workTitle: String?, workDescription: String?, relatedSkill: String?, workImage: UIImage?) {
        print("finding User")
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", CURRENT_USER!)
        
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
        
        let workEntity = NSEntityDescription.insertNewObjectForEntityForName("Work", inManagedObjectContext: managedObjectContext!) as! Work
        
        if let workTitle = workTitle {
           workEntity.setValue(workTitle, forKey: "workTitle")
        }
        
        if let workDescription = workDescription {
            workEntity.setValue(workDescription, forKey: "workDescription")
        }
        
        if let relatedSkill = relatedSkill {
           workEntity.setValue(relatedSkill, forKey: "relatedSkill")
        }
        
        if let workImage = workImage {
            workEntity.workImage = UIImagePNGRepresentation(workImage)
        }
        
        workEntity.owner = associatedUser
        
        print("Saving Work")
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        print("Done Saving Work")
    }
}

