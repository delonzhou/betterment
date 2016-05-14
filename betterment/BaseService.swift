//
//  BaseService.swift
//  betterment
//
//  Created by Mitul Manish on 21/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://mitulmanishtest.firebaseio.com/"
let FIREBASE_REF = Firebase(url: BASE_URL)

var CURRENT_USER: String{
    return (NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String)!
}
