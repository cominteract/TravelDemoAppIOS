//
//  VenueAmazing.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import Foundation


/// VenueAmazingmodel class
class VenueAmazing : NSObject {
    
    var amazingId : String = UUID().uuidString
    var headerId : String? = nil
    var name : String? = nil
    var location : String? = nil
    var items : [Int]? = nil
    
}
