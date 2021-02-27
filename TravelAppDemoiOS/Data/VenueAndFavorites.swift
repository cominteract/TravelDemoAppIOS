//
//  VenueAndFavorites.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit
import RealmSwift
@objcMembers class VenueAndFavorites : Object{
    dynamic var venueAndFaveId : String = UUID().uuidString
    dynamic var details : VenueDetails? = nil
    dynamic var venueFaves = RealmSwift.List<VenueFavorites>()
    
   
}
extension VenueAndFavorites : Identifiable {
       public var id : String { venueAndFaveId }
}
