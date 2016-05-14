//
//  Person+CoreDataProperties.swift
//  betterment
//
//  Created by Mitul Manish on 5/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var city: String?
    @NSManaged var address: String?
    @NSManaged var email: String?
    @NSManaged var profileImage: String?
    @NSManaged var userID: String?
    @NSManaged var bio: String?
    @NSManaged var skills: NSSet?
    @NSManaged var workItems: NSSet?
    
    func getNumberOfSkills() -> Int {
        return self.skills!.count;
    }
    
    func getNumberOfWorks() -> Int {
        return self.workItems!.count;
    }
    
    func getSkillsAsArray() -> [Skill] {
        return self.skills!.allObjects as! [Skill]
    }
    
    func getWorksAsArray() -> [Work]{
        return self.workItems!.allObjects as! [Work]
    }
    
    func getfullName() -> String{
        
        return self.firstName! + " " + self.lastName!
    }
}
