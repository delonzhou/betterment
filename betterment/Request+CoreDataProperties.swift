//
//  Request+CoreDataProperties.swift
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

extension Request {

    @NSManaged var requester: String?
    @NSManaged var requestee: String?
    @NSManaged var message: String?
    @NSManaged var proposedRate: NSNumber?
    @NSManaged var accepted: NSNumber?
    @NSManaged var rejected: NSNumber?

}
