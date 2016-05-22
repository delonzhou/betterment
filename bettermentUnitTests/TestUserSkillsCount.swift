//
//  TestUserSkillsCount.swift
//  betterment
//
//  Created by Mitul Manish on 22/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import XCTest
import CoreData
@testable import betterment

class TestUserSkillsCount: XCTestCase {
    
    var managedObjectContext: NSManagedObjectContext!
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        var managedContext: NSManagedObjectContext
            {
            get{
                return appDelegate.managedObjectContext
            }
        }
        return managedContext
    }
    
    override func setUp() {
        super.setUp()
        self.managedObjectContext = self.setUpInMemoryManagedObjectContext()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountOfUserSkills() {
        var initSkillCounter = 0
        
        // Check the number of rows in core data
        do {
            
            //fetch person entity
            let fetchRequest = NSFetchRequest(entityName: "Person")
            //fetch user with specific id
            fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", "id")
            
            var fetchedUsers = [Person]()
            
            do {
                
                let results = try managedObjectContext!.executeFetchRequest(fetchRequest)
                fetchedUsers = (results as? [Person])!
                
            } catch let error as NSError {
                
                print("Could not fetch \(error), \(error.userInfo)")
            }
            
            let associatedUser = fetchedUsers.first
            
            //fetch number of skill for that user
            initSkillCounter = (associatedUser?.getNumberOfSkills())!
            
            let skillEntity = NSEntityDescription.insertNewObjectForEntityForName("Skill", inManagedObjectContext: managedObjectContext!) as! Skill
            // set skill name
            skillEntity.setValue("Photography", forKey: "skillName")
            // set hourly rate
            let hourlyRateInput = "56"
            
            
            if let number = Int(hourlyRateInput) {
                let myNumber = NSNumber(integer: number)
                skillEntity.setValue(myNumber, forKey: "hourlyRate")
            } else {
                print("'\(hourlyRateInput)' did not convert to an Int")
            }
            //set experience
            let experienceInput = "2"
            if let number = Int(experienceInput) {
                let myNumber = NSNumber(integer: number)
                skillEntity.setValue(myNumber, forKey: "experience")
                
            } else {
                print("'\(experienceInput)' did not convert to an Int")
            }
            
            skillEntity.owner = associatedUser
            do{
                try managedObjectContext!.save()
            }
                
            catch{
                fatalError("Unable to save object")
            }
            
            //check if count of skillis increased for that user
            //XCTAssert(pass, "User is in the list")
            
            XCTAssert(initSkillCounter + 1  == associatedUser?.getNumberOfSkills(), "Skill is updated to user")
        }
        
    }
    
}
