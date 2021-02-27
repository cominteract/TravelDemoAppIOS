//
//  VenueAndFavesViewModel.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit

class VenueAndFavoritesViewModel: ObservableObject{
    var venueAndFaves : VenueAndFavorites = VenueAndFavorites()
    init(venueAndFaves_ : VenueAndFavorites){
        venueAndFaves = venueAndFaves_
        if let details_ = venueAndFaves_.details
        {
            details = details_
            imageUrl = details.url()
            venueName = details.name
        }
    }
    var details : VenueDetails = VenueDetails()
    var imageUrl = ""
    var venueName = ""
}

