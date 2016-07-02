//
//  Talent.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class Talent {
    
    var skillName: String?
    var hourlyRate: Int?
    var experience: Int?
    var skillImage: String?
    
    init(skill_name: String, hourly_rate: Int, experience: Int){
        self.skillName = skill_name
        self.hourlyRate = hourly_rate
        self.experience = experience
        self.skillImage = self.skillName?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
    }
}
