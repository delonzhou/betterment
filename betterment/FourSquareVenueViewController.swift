//
//  FourSquareVenueViewController.swift
//  betterment
//
//  Created by Mitul Manish on 20/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class FourSquareVenueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate, UISearchResultsUpdating  {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!

    var locationManager = CLLocationManager()
    let distanceSpan: Double = 50
    var currentLocation: CLLocation?
    
    var venuesList: [Venue]?
    var searchResults: [Venue] = []
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        venuesList = []
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways)
        {
            if locationManager.location != nil {
                
                self.currentLocation = locationManager.location
                
                VenueAPI.sharedInstance.getVenueWithLocation(currentLocation!){
                    
                    (let JSONDictionary) in
                    if let venuesDictionary = JSONDictionary{
                        //print(venuesDictionary)
                        
                        self.venuesList = VenueMaker.venuesAsList(venuesDictionary)
                        
                        dispatch_async(dispatch_get_main_queue()){
                            self.tableView.reloadData()
                            
                            for venue in self.venuesList!
                            {
                                let annotation = VenueAnnotation(title: venue.name, subtitle: venue.address, coordinate: CLLocationCoordinate2D(latitude: Double(venue.latitude!), longitude: Double(venue.longitude!)));
                                
                                self.mapView?.addAnnotation(annotation);
                                // Display the annotation
                                self.mapView.showAnnotations([annotation], animated: true)
                                self.mapView.selectAnnotation(annotation, animated: true)
                            }
                        }
                    }
                    else{
                        print ("Json dictionary is nil")
                    }
                }
            }
            
        } else {
            print("Not found")
        }
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.tintColor = UIColor.whiteColor()
        searchController?.searchBar.barTintColor = UIColor(red: 189.0/255, green: 195.0/255, blue: 199.0/255, alpha: 1.0)
        
        //searchController?.searchBar.searchBarStyle = .Minimal
        tableView.tableHeaderView = searchController?.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        if let mapView = self.mapView
        {
            mapView.delegate = self
        }
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return self.venuesList?.count ?? 0
        
        if searchController!.active {
            return searchResults.count
        } else {
            return venuesList!.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let currentVenue: Venue = (searchController.active) ? searchResults[indexPath.row] :
            (venuesList?[indexPath.row])!
        
        cell.textLabel!.text = currentVenue.name
        return cell
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        if let mapView = self.mapView {
            let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, self.distanceSpan, self.distanceSpan)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(MKUserLocation)
        {
            return nil;
        }
        
        var view = mapView.dequeueReusableAnnotationViewWithIdentifier("annotationIdentifier");
        
        if view == nil
        {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotationIdentifier");
        }
        
        view?.canShowCallout = true;
        
        return view;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // When the user taps a table view cell, attempt to pan to the pin in the map view
        let venue: Venue = (searchController.active) ? searchResults[indexPath.row] :
            (venuesList?[indexPath.row])!
        
        let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: Double(venue.latitude!), longitude: Double(venue.longitude!)), distanceSpan, distanceSpan);
        mapView?.setRegion(region, animated: true);
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            print(searchText)
            if searchText.characters.count >= 3 {
                self.currentLocation = locationManager.location
                
                VenueAPI.sharedInstance.getVenueWithLocation(currentLocation!, searchString: searchText){
                    
                    (let JSONDictionary) in
                    if let venuesDictionary = JSONDictionary{
                        print(venuesDictionary)
                        
                        self.searchResults = VenueMaker.venuesAsList(venuesDictionary)
                        
                        dispatch_async(dispatch_get_main_queue()){
                            self.tableView.reloadData()
                            
                            for venue in self.searchResults
                            {
                                let annotation = VenueAnnotation(title: venue.name, subtitle: venue.address, coordinate: CLLocationCoordinate2D(latitude: Double(venue.latitude!), longitude: Double(venue.longitude!)));
                                
                                self.mapView?.addAnnotation(annotation);
                                // Display the annotation
                                self.mapView.showAnnotations([annotation], animated: true)
                                self.mapView.selectAnnotation(annotation, animated: true)
                            }
                            self.venuesList = self.searchResults
                        }
                    }
                    else{
                        print ("Json dictionary is nil")
                    }
                }
                //filterContentForSearchText(searchText)
                //dispatch_async(dispatch_get_main_queue()){
                //self.tableView.reloadData()
            }
            
        }
        
    }

}
