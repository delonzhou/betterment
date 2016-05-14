//
//  Skill+CoreDataProperties.swift
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

extension Skill {

    @NSManaged var skillName: String?
    @NSManaged var experience: NSNumber?
    @NSManaged var hourlyRate: NSNumber?
    @NSManaged var owner: Person?
    
    func getSkillImageString() -> String{
        return (self.skillName?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: ""))!
    }

}
