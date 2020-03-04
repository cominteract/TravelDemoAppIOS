//
//  VenueDetailsDao.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/1/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift
class VenueDetailsDao: NSObject {
    
    func getVenueDetailFromHeader(header : String) -> [VenueDetails] {
        return AppDatabase.shared.venueDetailsFromHeader(header: header)
    }
      
    func insertVenueDetails(venueDetails : VenueDetails) {
        try! AppDatabase.shared.db.write {
            return AppDatabase.shared.db.add(venueDetails)
        }
    }
    
    func getVenueDetail(id : String) -> VenueDetails? {
        return AppDatabase.shared.venueDetails(id: id)
    }
    
    func getVenueDetailsWithLocation(headerLocation: String) -> [VenueDetails] {
        return AppDatabase.shared.venueDetails().filter{ $0.headerLocation == headerLocation }
    }
    
    func getVenueDetails() -> [VenueDetails] {
        return AppDatabase.shared.venueDetails()
    }
    
}
