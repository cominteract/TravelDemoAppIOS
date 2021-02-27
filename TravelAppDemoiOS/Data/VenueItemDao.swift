//
//  VenueItemDao.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit
import RealmSwift
class VenueItemDao: NSObject {
    
    func getVenueItem(name : String) -> VenueItem? {
        return AppDatabase.shared.venueItem(name : name)
    }
    
    func getVenueItems() -> Results<VenueItem> {
        return AppDatabase.shared.venueItems()
    }
    
    func insertTravelLocation(travelLocation : TravelLocations) {
        try! AppDatabase.shared.db.write {
            AppDatabase.shared.db.add(travelLocation)
        }
    }
    
    func getTravelLocations() -> Results<TravelLocations> {
        return AppDatabase.shared.travelLocations()
    }
    
    func insertAll(data : VenueExploreData){
        try! AppDatabase.shared.db.write {
            AppDatabase.shared.db.add(data)
            
        }
        
    }
    
    func insertVenueDetail(data : VenueData){
        try! AppDatabase.shared.db.write {
            AppDatabase.shared.db.add(data)
        }
        
    }
}
