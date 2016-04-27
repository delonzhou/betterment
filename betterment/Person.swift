//
//  Person.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class Person {
    
    var userID: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var city: String = ""
    var bio: String = ""
    var skill: [Skill]
    var work: [Work]
    var profileImage: String = ""
    var address: String?
    
    init(user_id: String, first_name: String, last_name: String, email: String, city: String, bio: String, skill: [Skill] = [], work: [Work] = [], profile_image: String, address: String){
        self.userID = user_id
        self.firstName = first_name
        self.lastName = last_name
        self.email = email
        self.city = city
        self.bio = bio
        self.skill = skill
        self.work = work
        self.profileImage = profile_image
        self.address = address
    }
    
    func fullName() -> String{
        return self.firstName + " " + self.lastName
    }
    
}
