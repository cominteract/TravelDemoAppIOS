//
//  AppDatabase.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 1/31/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift

class AppDatabase: NSObject {
    static let shared = AppDatabase()
    let db = try! Realm()
    
    let venueItemsDao = VenueItemDao()
    let venueDetailsDao = VenueDetailsDao()
    let venueFavesDao = VenueFavoritesDao()
    
    
    func venueFavorites() -> Results<VenueFavorites> {
        return db.objects(VenueFavorites.self)
    }
    
    func venueAndFavorites() -> Results<VenueAndFavorites> {
        return db.objects(VenueAndFavorites.self)
    }
    
    
    
    func venueItems() -> Results<VenueItem> {
        
        return db.objects(VenueItem.self)
    }
    
    func travelLocations() -> Results<TravelLocations> {
        return db.objects(TravelLocations.self)
    }
    
    func venueDetails() -> [VenueDetails] {
        return db.objects(VenueDetails.self).toArray()
    }
    
    func venueFavorite(venueFavoriteId : CLong) -> VenueFavorites? {
        let predicate = NSPredicate(format: "venueFavoriteId     = %@", venueFavoriteId)
        return db.objects(VenueFavorites.self).filter(predicate).first
    }
    
    func venueItem(name : String) -> VenueItem? {
        let predicate = NSPredicate(format: "name = %@", name)
        return db.objects(VenueItem.self).filter(predicate).first
    }
    
    func venueDetailsFromHeader(header : String) -> [VenueDetails] {
        let predicate = NSPredicate(format: "headerLocation = %@", header)
        return db.objects(VenueDetails.self).filter(predicate).toArray()
    }
    
    func venueDetails(id : String) -> VenueDetails? {
        let predicate = NSPredicate(format: "id = %@", id)
        return db.objects(VenueDetails.self).filter(predicate).first
    }
    
}
