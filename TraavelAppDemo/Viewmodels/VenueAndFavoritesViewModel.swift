//
//  VenueAndFavoritesViewModel.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/13/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
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
