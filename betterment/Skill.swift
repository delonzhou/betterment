//
//  Skill.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import RealmSwift

class Skill{
    
    var skill_name: String?
    var hourly_rate: Float?
    var experience: Int?
    var skill_image: String?
    
    init(skill_name: String, hourly_rate: Float, experience: Int){
        self.skill_name = skill_name
        self.hourly_rate = hourly_rate
        self.experience = experience
        self.skill_image = self.skill_name?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
    }
}
