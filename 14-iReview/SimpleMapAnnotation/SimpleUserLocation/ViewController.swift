//
//  ViewController.swift
//  SimpleUserLocation
//
//  Created by Phil Wright on 2/16/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()

        self.updateLocationTapped()
    }
    
    @IBAction func updateLocationTapped() {

        let status = CLAuthorizationStatus.AuthorizedWhenInUse
        
        if status != .Denied {
            self.mapView.showsUserLocation = true
            self.locationManager.requestLocation()
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        self.updateLocationTapped()
    }


    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locations.count > 0 {
            let location = locations.first
            print(location?.coordinate.latitude)
            print(location?.coordinate.longitude)
            
            // Find the Center Coordinate
            if let center = location?.coordinate {
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                self.mapView.setRegion(region, animated: true)
                self.mapView.showsUserLocation = true
                
                self.createAnnotation("Apple Computer", subTitle: "", coordinate: center)
                print("mapView updated")
            }
            
        }
        print("location updated")
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    
    func geoLocation(fullAddressString:String) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(fullAddressString, completionHandler: { placemarks, error in
        
            
            })
    }
    
    func createAnnotation(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subTitle
        annotation.coordinate = coordinate
        
        if self.mapView != nil {
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPinIdentifier"
        
        
        // ensure annotation
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            
            // pin color
            annotationView?.pinTintColor = UIColor.orangeColor()
            
            // Ensure proper use of identifier
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            // show Callout (true/false)
            annotationView?.canShowCallout = true
        
            let leftIconView = UIImageView(frame: CGRectMake(0, 0, 37, 30))
            leftIconView.image = UIImage(named: "apple")
            annotationView?.leftCalloutAccessoryView = leftIconView
//
//            // Automatically select the annotation
//            self.mapView.selectAnnotation(annotation, animated: false)
        }
        
        return annotationView
    }


}