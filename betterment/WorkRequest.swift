//
//  WorkRequest.swift
//  betterment
//
//  Created by Mitul Manish on 8/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class WorkRequest{
    
    var requestee: String? // person requested
    var requester: String? // person requeting
    var skillName: String?
    var rejected: NSNumber?
    var accepted: NSNumber?
    var proposedRate: NSNumber?
    var message: String?

    init(requestee: String, requester: String, skillName: String, rejected: NSNumber, accepted: NSNumber,
         proposedRate: NSNumber, message: String){

        self.requestee = requestee
        self.requester = requester
        self.skillName = skillName
        self.rejected = rejected
        self.accepted = accepted
        self.proposedRate = proposedRate
        self.message = message

    }

}
