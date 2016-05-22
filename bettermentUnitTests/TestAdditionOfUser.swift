//
//  TestAdditionOfUser.swift
//  betterment
//
//  Created by Mitul Manish on 22/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import XCTest
import CoreData
@testable import betterment

class TestAdditionOfUser: XCTestCase {
    
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
    
    
    func testIncrementInUser() {
        //check if a number of rows are incremented when user is added
        do {
            //iniat fetch of row
            var fetchRequest = NSFetchRequest(entityName:"Person")
            var fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Person]
            // save number of rows in variable
            let initCount = fetchedResults!.count
            
            let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: managedObjectContext!) as! Person
            
            // add new user
            entity.setValue("Ankur", forKey: "firstName")
            entity.setValue("Dabral", forKey: "lastName")
            entity.setValue("abc@gmail.com", forKey: "email")
            entity.setValue("CBD", forKey: "address")
            entity.setValue("Melbourne", forKey: "city")
            entity.setValue("bio", forKey: "bio")
            entity.setValue("id", forKey: "userID")
            entity.setValue("abc.png", forKey: "profileImage")
            
            do{ //save new user
                try managedObjectContext!.save()
            }
            catch{
                fatalError("Unable to save object")
            }
            
            // fectching number of row after adding new user
            fetchRequest = NSFetchRequest(entityName:"Person")
            fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Person]
            
            //check if the number of row is incremented
            
            XCTAssertGreaterThan(fetchedResults!.count, initCount, "new person is successfully added")
        }  catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
}
