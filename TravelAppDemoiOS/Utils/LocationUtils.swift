//
//  LocationUtils.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit
import CoreLocation
class LocationUtils: NSObject {
    static func isAlreadyChecked(lat : Double, lon : Double, items : Array<TravelLocations>) -> Bool{
        return items.filter({ ($0.lat == lat && $0.lon == lon) || (($0.lat > lat && $0.lat - lat <= 1) && ($0.lon > lon && $0.lon - lon <= 1)) || (($0.lat < lat && lat - $0.lat <= 1) && ($0.lon < lon && lon - $0.lon <= 1)) }).count > 0
    }
    
    static func alreadyCovered(origin : CLLocation, destination : CLLocation) -> Bool{
        return origin.distance(from: destination) < 500
    }
    
    static func isClose(lat : Double, lon : Double, items : Array<TravelLocations> ) -> Bool {
        return !items.filter({ alreadyCovered(origin: CLLocation.init(latitude: lat, longitude: lon), destination: CLLocation.init(latitude: $0.lat, longitude: $0.lon)) }).isEmpty
    }
    
    static func locationQuery(lat : Double, lon : Double) -> String{
        return "\(lat),\(lon)"
    }
}
