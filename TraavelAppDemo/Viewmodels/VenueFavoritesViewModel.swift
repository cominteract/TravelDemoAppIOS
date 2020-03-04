
//
//  VenueFavoritesViewModel.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/13/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class VenueFavoritesViewModel: ObservableObject {
    var venueFaveRepository : FaveRepository
    init(venueFaveRepository_ : FaveRepository){
        venueFaveRepository = venueFaveRepository_
        venueFavorites = venueFaveRepository_.getVenueFavorites()
        venueAndFavorites = venueFaveRepository_.getVenueAndFavorites()
    }
    
    func refresh()
    {
        venueFavorites = venueFaveRepository.getVenueFavorites()
        venueAndFavorites = venueFaveRepository.getVenueAndFavorites()
    }
    
    func isFavorited(venueId : String) -> Bool {
        return venueAndFavorites.filter({ $0.venueAndFaveId == venueId  }).count > 0
    }
    
    var venueFavorites : [VenueFavorites]
    var venueAndFavorites : [VenueAndFavorites]
}
