//
//  Venue.swift
//  foursquareAPI
//
//  Created by Mitul Manish on 19/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import MapKit

class Venue {
    
    var id: String?
    var name: String?
    
    var latitude: Double?
    var longitude: Double?
    var distance: Int?
    
    var address: String?
    var streetAddress: String?
    
    var coordinate: CLLocation {
        return CLLocation(latitude: latitude!, longitude: longitude!)
    }
    
    var distanceInKm: Float {
        return Float(distance!)/Float(1000)
    }
}
