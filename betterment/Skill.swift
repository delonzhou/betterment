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
    
    var skill_name: String = ""
    var hourly_rate: Float = 0.0
    var experience: Int = 0
    
    init(skill_name: String, hourly_rate: Float, experience: Int){
        self.skill_name = skill_name
        self.hourly_rate = hourly_rate
        self.experience = experience
    }
}
