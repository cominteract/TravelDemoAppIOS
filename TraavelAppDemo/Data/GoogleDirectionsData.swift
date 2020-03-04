//
//  GoogleDirectionsData.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 3/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift
import Realm
import CoreLocation
import MapKit
@objcMembers class GoogleDirectionsData: Object, Codable {
    dynamic var googleDirectionsId = UUID.init().uuidString
    dynamic var status : String = "OK"
    dynamic var routes = RealmSwift.List<Routes>()
    
    enum CodingKeys: String, CodingKey {
           case status
           case routes
    }
       
    static func convertDataToPolylineWithPoly(data : GoogleDirectionsData) -> [CLLocationCoordinate2D]{
        var routeList = [CLLocationCoordinate2D]()
        for route in data.routes{
            for leg in route.legs{
                for (index, step) in leg.steps.enumerated() {
                    if let endloc = step.end_location, index == leg.steps.count - 1 {
                        var latlng = CLLocationCoordinate2DMake(endloc.lat,  endloc.lng)
                        routeList.append(latlng)
                        if let endaddress = leg.end_address{
                            
                        }
                    }
                    if let startloc = step.start_location, index != leg.steps.count - 1 {
                        var latlng = CLLocationCoordinate2DMake(startloc.lat,  startloc.lng)
                        routeList.append(latlng)
                        if index == 0{
                            
                        }else{
                            
                        }
                    }
                   
                }
            }
        }
        return routeList
    }
    
    static func convertDataToPolylineWithMarker(data : GoogleDirectionsData) -> [MKPointAnnotation]{
        var routeList = [MKPointAnnotation]()
        for route in data.routes{
            for leg in route.legs{
                for (index, step) in leg.steps.enumerated() {
                    if let endloc = step.end_location, index == leg.steps.count - 1 {
                        
                        if let endaddress = leg.end_address{
                            let annotation1 = MKPointAnnotation()
                            annotation1.coordinate = CLLocationCoordinate2D(latitude: endloc.lat, longitude: endloc.lng)
                            annotation1.title = endaddress
                            routeList.append(annotation1)
                        }
                    }
                    if let startloc = step.start_location,index != leg.steps.count - 1 {
                        let annotation2 = MKPointAnnotation()
                        
                        if let start_address = leg.start_address, index == 0{
                            annotation2.coordinate = CLLocationCoordinate2D(latitude: startloc.lat, longitude: startloc.lng)
                            annotation2.title = start_address
                            
                        }else if let maneuver = step.maneuver, let text = step.duration?.text{
                            
                            annotation2.coordinate = CLLocationCoordinate2D(latitude: startloc.lat, longitude: startloc.lng)
                            annotation2.title = "\(maneuver) \(text)"
                        }
                        routeList.append(annotation2)
                    }
                   
                }
            }
        }
        return routeList
    }
    
    override static func primaryKey() -> String?
    {
        return "googleDirectionsId"
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // venueItemId = try container.decode(String.self, forKey: .venueItemId)
        
        status = try container.decode(String.self, forKey: .status)
        let routesList = try container.decode([Routes].self, forKey: .routes)
        routes.append(objectsIn: routesList)
        super.init()
    }
    
    required init() {
        super.init()
    }
}

@objcMembers class Routes : Object, Codable {
    dynamic var summary : String = "Summary"
    dynamic var legs = RealmSwift.List<Legs>()
    dynamic var routeId = UUID.init().uuidString
    enum CodingKeys: String, CodingKey {
              case summary
              case legs
    }
          
       
    override static func primaryKey() -> String?
    {
        return "routeId"
    }
       
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
           
        // venueItemId = try container.decode(String.self, forKey: .venueItemId)
           
        summary = try container.decode(String.self, forKey: .summary)
        let legsList = try container.decode([Legs].self, forKey: .legs)
        legs.append(objectsIn: legsList)
        super.init()
    }
       
    required init() {
        super.init()
    }
}

@objcMembers class Legs : Object, Codable {
    dynamic var steps = RealmSwift.List<Steps>()
    dynamic var distance : Distance?
    dynamic var duration : Distance?
    dynamic var start_location : GoogleLocation?
    dynamic var end_location : GoogleLocation?
    dynamic var start_address : String?
    dynamic var end_address : String?
    dynamic var legId  = UUID.init().uuidString
    enum CodingKeys: String, CodingKey {
        case steps
        case distance
        case duration
        case start_location
        case end_location
        case start_address
        case end_address

    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
                 
        // venueItemId = try container.decode(String.self, forKey: .venueItemId)
                 
        distance = try? container.decode(Distance.self, forKey: .distance)
        duration = try? container.decode(Distance.self, forKey: .duration)
        start_location = try? container.decode(GoogleLocation.self, forKey: .start_location)
        end_location = try? container.decode(GoogleLocation.self, forKey: .end_location)
        start_address = try? container.decode(String.self, forKey: .start_address)
        end_address = try? container.decode(String.self, forKey: .end_address)
        let stepsList = try container.decode([Steps].self, forKey: .steps)
        steps.append(objectsIn: stepsList)
        super.init()
    }
             
    required init() {
        super.init()
    }
}

@objcMembers class Distance : Object, Codable {
    dynamic var text : String = ""
    dynamic var value : Int = 0
    dynamic var distanceId : String = UUID.init().uuidString
    enum CodingKeys: String, CodingKey {
        case text
        case value
    }
    override static func primaryKey() -> String?
    {
        return "distanceId"
    }
           
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
               
            // venueItemId = try container.decode(String.self, forKey: .venueItemId)
               
        text = try container.decode(String.self, forKey: .text)
        value = try container.decode(Int.self, forKey: .value)
        super.init()
    }
           
    required init() {
        super.init()
    }
}

@objcMembers class GoogleLocation : Object, Codable {
    dynamic var lat : Double = 0.0
    dynamic var lng : Double = 0.0
    dynamic var locationId : String = UUID.init().uuidString
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
    override static func primaryKey() -> String?
    {
        return "locationId"
    }
           
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
               
            // venueItemId = try container.decode(String.self, forKey: .venueItemId)
               
        lat = try container.decode(Double.self, forKey: .lat)
        lng = try container.decode(Double.self, forKey: .lng)
        super.init()
    }
           
    required init() {
        super.init()
    }
}

@objcMembers class Steps : Object, Codable {
    dynamic var travel_mode : String?
    dynamic var maneuver : String?
    
    dynamic var start_location : GoogleLocation?
    dynamic var end_location : GoogleLocation?
    dynamic var distance : Distance?
    dynamic var duration : Distance?
    dynamic var stepId : String = UUID.init().uuidString
    enum CodingKeys: String, CodingKey {
        case travel_mode
        case maneuver
        case distance
        case duration
        case start_location
        case end_location

    }
    
    
    override static func primaryKey() -> String?
    {
        return "stepId"
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
                 
        // venueItemId = try container.decode(String.self, forKey: .venueItemId)
                 
        distance = try? container.decode(Distance.self, forKey: .distance)
        duration = try? container.decode(Distance.self, forKey: .duration)
        start_location = try? container.decode(GoogleLocation.self, forKey: .start_location)
        end_location = try? container.decode(GoogleLocation.self, forKey: .end_location)
        maneuver = try? container.decode(String.self, forKey: .maneuver)
        travel_mode = try? container.decode(String.self, forKey: .travel_mode)
    }
    
    required init() {
        super.init()
    }
}



@objcMembers class GeocodedWaypoints : Object, Codable {
    dynamic var geocoder_status : String
    dynamic var place_id : String
}
