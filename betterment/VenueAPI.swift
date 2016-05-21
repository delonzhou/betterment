//
//  VenueAPI.swift
//  foursquareAPI
//
//  Created by Mitul Manish on 19/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//


import Foundation
import QuadratTouch
import MapKit
import RealmSwift

struct API {
    struct notifications {
        static let venuesUpdated = "venues_updated";
    }
}

class VenueAPI
{
    static let sharedInstance = VenueAPI()
    
    var session:Session?
    var venuesList: [Venue] = []
    
    init()
    {
        // Initialize the Foursquare client
        // Note: It's not recommended to put API secrets into public GitHub code. You can imagine the secrets below don't work, so get your own!
        
        let client = Client(clientID: "TJR3SYDQKNBGQ2W1DXKOW5KZZJD1ZYAL2RY4FZIEIW43HOOI", clientSecret: "G2YS03EZGIU4YE01PITAFCXU10KTPXGCUEUYHKBAXPTWK1KX", redirectURL: "")
        
        let configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        
        self.session = Session.sharedSession()
    }
    
    func getVenueWithLocation(location: CLLocation, searchString: String = "Coffee", completionHandler: ([[String: AnyObject]]? -> Void))
    {
        if let session = self.session
        {
            // Provide the user location and the hard-coded Foursquare category ID for "Coffeeshops"
            var parameters = location.parameters();
            //parameters += [Parameter.categoryId: "4bf58dd8d48988d1e0931735"]
            parameters += [Parameter.query: searchString]
            parameters += [Parameter.radius: "2000"]
            parameters += [Parameter.limit: "5"]
            
            // Start a "search", i.e. an async call to Foursquare that should return venue data
            let searchTask = session.venues.search(parameters)
            {
                (result) -> Void in
                
                if let response = result.response
                {
                    if let venues = response["venues"] as? [[String: AnyObject]]
                        // collection of maps
                    {
                        completionHandler(venues)
                    }
                }
            }
            searchTask.start()
        }
    }
    
    
}

extension CLLocation
{
    func parameters() -> Parameters
    {
        let ll      = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc   = "\(self.horizontalAccuracy)"
        let alt     = "\(self.altitude)"
        let altAcc  = "\(self.verticalAccuracy)"
        let parameters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}
