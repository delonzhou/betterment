//
//  Person.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class Person: NSObject {
    
    var first_name: String = ""
    var last_name: String = ""
    var email: String = ""
    var city: String = ""
    var bio: String = ""
    var skill: [Skill]
    var work: [Work]
    var profile_image: String = ""
    var address: String?
    
    required init(first_name: String, last_name: String, email: String, city: String, bio: String, skill: [Skill] = [], work: [Work] = [], profile_image: String, address: String){
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.city = city
        self.bio = bio
        self.skill = skill
        self.work = work
        self.profile_image = profile_image
        self.address = address
    }
    
    func fullName() -> String{
        return self.first_name + " " + self.last_name
    }
    
}
