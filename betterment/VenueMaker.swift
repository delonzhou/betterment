//
//  VenueMaker.swift
//  foursquareAPI
//
//  Created by Mitul Manish on 20/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class VenueMaker {
    
    static func venuesAsList(venuesDictionary: [[String: AnyObject]]) -> [Venue] {
        
        var venueList: [Venue] = []
        
        for venue: [String: AnyObject] in venuesDictionary {
            
            let venueObject: Venue = Venue()
            
            if let id = venue["id"] as? String
            {
                venueObject.id = id
            }
            
            if let name = venue["name"] as? String
            {
                venueObject.name = name
            }
            
            if  let location = venue["location"] as? [String: AnyObject]
            {
                if let longitude = location["lng"] as? Double
                {
                    venueObject.longitude = longitude
                }
                
                if let latitude = location["lat"] as? Double
                {
                    venueObject.latitude = latitude
                }
                
                if let distance = location["distance"] as? Int
                {
                    venueObject.distance = distance
                }
                
                if let shortAddress = location["address"] as? String {
                    venueObject.streetAddress = shortAddress
                }
                
                if let formattedAddress = location["formattedAddress"] as? [String]
                {
                    venueObject.address = formattedAddress.joinWithSeparator(" ")
                }
                
            }
            
        venueList.append(venueObject)
        }
    return venueList
    }
}
