/*:
![Remote Image](https://www.theironyard.com/etc/designs/theironyard/icons/iron-yard-logo.svg)
## Geocoding - Completion Handlers
*/

import UIKit
import CoreLocation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

func geocoding(location: String, completion: (Double, Double) -> ()) {
    CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
        if placemarks?.count > 0 {
            let placemark = placemarks?[0]
            let location = placemark!.location
            let coordinate = location?.coordinate
            completion((coordinate?.latitude)!, (coordinate?.longitude)!)
        }
    }
}

geocoding("84119") { (latitude: Double, longitude: Double) in
    
    print(latitude)
    print(longitude)
}



