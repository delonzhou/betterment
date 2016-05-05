//
//  ForecastService.swift
//  Mist
//
//  Created by Mitul Manish on 22/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

struct ForecastService{
    
    
    var baseURL: NSURL?
    var apiKey: String?
    
    init(apiKey: String?, baseURL base: String?){
        
        self.apiKey = apiKey
        self.baseURL = NSURL(string: base! + "/" + self.apiKey! + "/")
    }
    
    func getForecast(latitude: Double, longitude: Double, completionHandler: (CurrentWeather? -> Void)){
        
        if let forecastUrl = NSURL(string: "\(latitude),\(longitude)", relativeToURL: self.baseURL){
            let networkOperation = NetworkOperation(url: forecastUrl)
            networkOperation.downloadJSONFromURL(){
                (let JSONDictionary) in
                if let weatherDictionary = JSONDictionary{
                    completionHandler(self.currentWeatherFromJson(weatherDictionary))
                }
                else{
                    print ("Json dictionary is nil")
                }
            }
        }
        else{
            print("Problem in creating the forecast URL")
        }
        
    }
    
    func currentWeatherFromJson(JSONDictionary: [String: AnyObject]?) -> CurrentWeather?{
        if let currentJSONDictionary = JSONDictionary?["currently"] as? [String: AnyObject]{
            return  CurrentWeather(weatherDictionary: currentJSONDictionary)
        }
        else{
            print("No currently key found or content is nil")
            return nil
        }
    }
}
