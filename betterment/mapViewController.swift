import UIKit
import MapKit

class mapViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString((person?.address)!) { (placemarks, errors) in
            
            if errors != nil {
                print(errors)
                return
            }
            
            let placemark = placemarks?.first
            let annotation = MKPointAnnotation()
            annotation.title = self.person?.getfullName()
            annotation.subtitle = self.person!.getSkillsAsArray().first?.skillName
            
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
        leftIconView.image = UIImage(named: (self.person?.profileImage)!)
        annotationView?.leftCalloutAccessoryView = leftIconView
        return annotationView
    }
    
}
