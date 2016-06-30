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
import CoreLocation

class CurrentWeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherSummaryLabel: UILabel?
    @IBOutlet weak var currentWeatherIcon: UIButton!
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentPrecipProbailityLabel: UILabel?
    
    var locationManager = CLLocationManager()
    var currentWeatherInstance: CurrentWeather?
    private let apiKey = "c96b1383d1efcd33ea8e9f24e6b49502"
    var weatherService: ForecastService?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways)
        {
            // Use hard coded latitude and longitude values while testing with simulator
            //fetchWeatherData(-37.8879, longitude: 145.0952 )
            
            // Use the phone's gps when testing on the actual device
            fetchWeatherData((locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
            
        } else {
            print("Not found")
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError: \(error.description)")
    }
    
    func fetchWeatherData(latitude: Double, longitude: Double){
        
        let baseURL = "https://api.forecast.io/forecast"
        weatherService = ForecastService(apiKey: self.apiKey, baseURL: baseURL)
        
        weatherService?.getForecast(latitude, longitude: longitude){
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
                        self.currentPrecipProbailityLabel?.text = "Rain Chance: \(precipitation)%"
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
    
}


