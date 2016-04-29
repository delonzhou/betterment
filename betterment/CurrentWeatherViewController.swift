//
//  CurrentWeatherViewController.swift
//  betterment
//
//  Created by Mitul Manish on 29/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

//
//  ViewController.swift
//  Mist
//
//  Created by Mitul Manish on 21/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherSummaryLabel: UILabel?
    
    
    @IBOutlet weak var currentWeatherIcon: UIButton!
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    
    @IBOutlet weak var currentPrecipProbailityLabel: UILabel?
    
    
    var currentWeatherInstance: CurrentWeather?
    
    let latitude = -37.8136
    let longitude = 144.9631
    private let apiKey = "c96b1383d1efcd33ea8e9f24e6b49502"
    
    var weatherService: ForecastService?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://api.forecast.io/forecast"
        
        weatherService = ForecastService(apiKey: self.apiKey, baseURL: baseURL)
        weatherService?.getForecast(self.latitude, longitude: self.longitude){
            (let currentWeather) in
            
            if let currentWeatherSnapshot = currentWeather{
                
                dispatch_async(dispatch_get_main_queue()){
                    if let temeperatureCelcius = currentWeatherSnapshot.temperatureinCelcius{
                        self.currentTemperatureLabel?.text = "\(temeperatureCelcius)º"
                    }
                    
                    if let weatherSummary = currentWeatherSnapshot.summary{
                        self.weatherSummaryLabel?.text = weatherSummary
                    }
                    
                    if let precipitation = currentWeatherSnapshot.precipProbability{
                        self.currentPrecipProbailityLabel?.text = "\(precipitation)%"
                    }
                    
                    if let iconString = currentWeatherSnapshot.currentWeatherCondition{
                        if let iconImage: UIImage = IconFactory(iconName: iconString).toImage(){
                            self.currentWeatherIcon?.setImage(iconImage, forState: .Normal)
                        }
                    }
                }
            }
            else{
                print("Problem in retrieving the current weather")
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


