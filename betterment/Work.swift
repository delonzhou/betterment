//
//  Work.swift
//  betterment
//
//  Created by Mitul Manish on 18/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import RealmSwift

class Work {
    
    var title: String = ""
    var description: String = ""
    var related_skill: String = ""
    var images: [String] = []
    
    required init(title: String, description: String, related_skill: String, images: [String]){
        self.title = title
        self.description = description
        self.related_skill = related_skill
        self.images = images
    }
}