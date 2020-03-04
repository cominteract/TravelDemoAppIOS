//
//  VenueAmaze.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import Foundation


/// VenueAmazemodel class
class VenueAmaze : NSObject {
    
    var venueAmazeId : String = UUID().uuidString
    var venueHeaderId : String? = nil
    var name : String? = nil
    var location : String? = nil
    var items : [String]? = nil
    
}
