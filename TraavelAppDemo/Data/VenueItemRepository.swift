//
//  VenueItemRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift

class VenueItemRepository: ItemRepository {
 
    
    
    var venueItemDao : VenueItemDao
    
    func getVenueItem(venueName: String) -> VenueItem? {
        venueItemDao.getVenueItem(name: venueName)
    }
    
    func insertVenueItem(venueItem: VenueItem) {
        
    }
    
    func getNearbyVenueItems(travelLocations: TravelLocations) -> [VenueItem] {
        venueItemDao.getVenueItems().toArray().filter({ "\(travelLocations.lat),\(travelLocations.lon)" ==  $0.latLng })
     }
    
    func insertAll(venueExploreData: VenueExploreData) {
        venueItemDao.insertAll(data: venueExploreData)
    }
    
    func insertTravelLocations(travelLocations: TravelLocations) {
        venueItemDao.insertTravelLocation(travelLocation: travelLocations)
    }
    
    init(venueItemDao_ : VenueItemDao){
        venueItemDao = venueItemDao_
    }
    
    func getVenueItems() -> [VenueItem] {
        return venueItemDao.getVenueItems().toArray()
    }
    
    func getTravelLocations() -> [TravelLocations] {
        return venueItemDao.getTravelLocations().toArray()
    }
}
