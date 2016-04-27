//
//  Skill.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class Skill{
    
    var skillName: String?
    var hourlyRate: Float?
    var experience: Int?
    var skillImage: String?
    
    init(skill_name: String, hourly_rate: Float, experience: Int){
        self.skillName = skill_name
        self.hourlyRate = hourly_rate
        self.experience = experience
        self.skillImage = self.skillName?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
    }
}
