//
//  VenueAnnotation.swift
//  foursquareAPI
//
//  Created by Mitul Manish on 20/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import MapKit

class VenueAnnotation: NSObject, MKAnnotation
{
    let title:String?;
    let subtitle:String?;
    let coordinate: CLLocationCoordinate2D;
    
    init(title: String?, subtitle:String?, coordinate: CLLocationCoordinate2D)
    {
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = coordinate;
        
        super.init();
    }
}
