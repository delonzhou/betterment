//
//  Work+CoreDataProperties.swift
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

extension Work {

    @NSManaged var workTitle: String?
    @NSManaged var workDescription: String?
    @NSManaged var workImage: NSData?
    @NSManaged var relatedSkill: String?
    @NSManaged var owner: Person?

}
