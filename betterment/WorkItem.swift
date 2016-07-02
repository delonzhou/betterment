//
//  WorkItem.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class WorkItem {
    
    var title: String = ""
    var description: String = ""
    var relatedSkill: String = ""
    var image: String = ""
    
    init(title: String, description: String, related_skill: String, image: String){
        self.title = title
        self.description = description
        self.relatedSkill = related_skill
        self.image = image
    }
}