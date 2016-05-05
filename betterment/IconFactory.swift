//
//  IconFactory.swift
//  Mist
//
//  Created by Mitul Manish on 22/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation
import UIKit

struct IconFactory{
    var input: String?
    
    init(iconName input: String){
        self.input = input
    }
    
    func toImage() -> UIImage?{
        var imageName: String?
        
        if let inputIcon = self.input{
            switch inputIcon{
            case "clear-day":
                imageName = "clear-day.png"
            case "clear-night":
                imageName = "clear-night.png"
            case "rain":
                imageName = "rain.png"
            case "snow":
                imageName = "snow.png"
            case "sleet":
                imageName = "sleet.png"
            case "wind":
                imageName = "wind.png"
            case "fog":
                imageName = "fog.png"
            case "cloudy":
                imageName = "cloudy.png"
            case "cloudy-day":
                imageName = "cloudy-day.png"
            case "cloudy-night":
                imageName = "cloudy-night.png"
            case "hail":
                imageName = "hail.png"
            case "thunderstorm":
                imageName = "thunderstorm.png"
            case "tornado":
                imageName = "tornado.png"
            default:
                imageName = "default.png"
            }
            return UIImage(named: imageName!)
        }
        else{
            print("Input not available")
            return nil
        }
        
    }
    
    
    
    
    
    
    
    
    
}
