//
//  VenueAndFavorites.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/12/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
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
