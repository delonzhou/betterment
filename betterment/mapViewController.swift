//
//  mapViewController.swift
//  betterment
//
//  Created by Mitul Manish on 28/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString("89 c pocket c siddharha extension ashram new delhi 110014 india") { (placemarks, errors) in
            
            if errors != nil {
                print(errors)
                return
            }
            
            let placemark = placemarks?.first
            let annotation = MKPointAnnotation()
            annotation.title = self.person?.fullName()
            annotation.subtitle = self.person!.skill.first?.skill_name
            
            if let location = placemark?.location{
                annotation.coordinate = location.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        
        }
            
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        // Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? =
            mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as?
        MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation,
                                                 reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: (self.person?.profile_image)!)
        annotationView?.leftCalloutAccessoryView = leftIconView
        return annotationView
    }
    
    

        // Do any additional setup after loading the view.





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
