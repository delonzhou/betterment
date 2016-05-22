//
//  TestSearchUser.swift
//  betterment
//
//  Created by Mitul Manish on 22/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import XCTest
import CoreData
@testable import betterment

class TestSearchUser: XCTestCase {
    
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
    
    func testCountOfUser() {
        var pass = false
        // Check the number of rows in core data
        do {
            //fetch person entity
            let fetchRequest = NSFetchRequest(entityName:"Person")
            let fetchedResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Person]
            //check for user in fetched results
            for Person in fetchedResults! {
                if (Person.getfullName() == "Mitul Manish") {
                    pass = true
                }
            }
            //check if count if equal to desired output
            //XCTAssert(pass, "User is in the list")
            XCTAssertFalse(pass, "User is not in the list")
        }  catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
}
