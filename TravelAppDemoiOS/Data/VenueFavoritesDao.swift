//
//  VenueFavoritesDao.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit

class VenueFavoritesDao: NSObject {
    func getVenueFavorites() -> [VenueFavorites]{
        return AppDatabase.shared.venueFavorites().toArray()
    }
    func getVenueFavorite(id : CLong) -> VenueFavorites? {
        return AppDatabase.shared.venueFavorite(venueFavoriteId: id)
    }
    
    func getVenueAndFavorites() -> [VenueAndFavorites] {
        return AppDatabase.shared.venueAndFavorites().toArray()
    }
    
    func insertVenueAndFavorite(venueAndFavorite : VenueAndFavorites){
        try! AppDatabase.shared.db.write {
            AppDatabase.shared.db.add(venueAndFavorite)
        }
    }
    
    func insertVenueFavorite(venueFavorite : VenueFavorites){
        try! AppDatabase.shared.db.write {
            AppDatabase.shared.db.add(venueFavorite)
        }
    }
    
    func deleteVenueFavorite(venueFavorite : VenueFavorites){
        try! AppDatabase.shared.db.write {
            AppDatabase.shared.db.delete(venueFavorite)
        }
    }
}
