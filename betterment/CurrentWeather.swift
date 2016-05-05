//
//  CurrentWeather.swift
//  Mist
//
//  Created by Mitul Manish on 21/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather{
    
    let temperatureinCelcius: Int?
    let summary: String?
    let precipProbability: Int?
    let humidity: Int?
    let currentWeatherCondition: String?
    
    init(weatherDictionary: [String: AnyObject]){
        
        
        if let currentTemperature = weatherDictionary["temperature"] as? Int{
            temperatureinCelcius = ((currentTemperature - 32) * 5)/9
        }
        else{
            temperatureinCelcius = nil
        }
        
        if let currentWeatherSummary = weatherDictionary["summary"] as? String{
            summary = currentWeatherSummary
        }
        else{
            summary = nil
        }
        
        if let currentWeatherPrecipProbability = weatherDictionary["precipProbability"] as? Double{
            precipProbability = Int(currentWeatherPrecipProbability * 100)
        }
        else{
            precipProbability = nil
        }
        
        if let currentHumidity = weatherDictionary["humidity"] as? Double {
            humidity = Int(currentHumidity * 100)
        }
        else{
            humidity = nil
        }
        
        if let currentCondition = weatherDictionary["icon"] as? String{
            self.currentWeatherCondition = currentCondition
        }
        else{
            self.currentWeatherCondition = nil;
        }
    }
}
