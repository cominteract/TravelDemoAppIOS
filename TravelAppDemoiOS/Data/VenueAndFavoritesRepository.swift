//
//  VenueAndFavoritesRepository.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
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
