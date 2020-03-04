//
//  VenueAndFavoritesRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/13/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift
class VenueAndFavoritesRepository: FaveRepository {

    var venueFaveDao : VenueFavoritesDao
    init(venueFaveDao_ : VenueFavoritesDao){
        
        venueFaveDao = venueFaveDao_
    }
    
    func removeVenueFavorites(venueFavorites: VenueFavorites) {
        venueFaveDao.deleteVenueFavorite(venueFavorite: venueFavorites)
    }
    
    
    func createVenueFavorites(details : VenueDetails) {
        
        let venueFavorites = VenueFavorites()
        venueFavorites.favedetailId = details.id
        venueFaveDao.insertVenueFavorite(venueFavorite: venueFavorites)
        let venueAndFavorites = VenueAndFavorites()
        venueAndFavorites.venueAndFaveId = details.id
        venueAndFavorites.details = details
        venueAndFavorites.venueFaves = List<VenueFavorites>()
        venueAndFavorites.venueFaves.append(venueFavorites)
        venueFaveDao.insertVenueAndFavorite(venueAndFavorite: venueAndFavorites)
    }
    
    func getVenueFavorites() -> [VenueFavorites] {
        return venueFaveDao.getVenueFavorites()
    }
    
    func getVenueAndFavorites() -> [VenueAndFavorites] {
        return venueFaveDao.getVenueAndFavorites()
    }
}
