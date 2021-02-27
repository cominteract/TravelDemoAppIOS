//
//  VenueFavoritesViewModel.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
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
