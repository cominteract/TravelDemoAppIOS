//
//  VenueDetailsRepository.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit

class VenueDetailsRepository: DetailRepository {
    var venueDetailsDao : VenueDetailsDao

    init(venueDetailsDao_ : VenueDetailsDao){
        venueDetailsDao = venueDetailsDao_

    }
    
    func insert(venueDetails: VenueDetails) {
        venueDetailsDao.insertVenueDetails(venueDetails: venueDetails)
    }
    
    func getVenueDetailsWithLocation(headerLocation: String) -> [VenueDetails] {
        return venueDetailsDao.getVenueDetailFromHeader(header: headerLocation)
    }
    
    func getVenueDetail(id : String) -> VenueDetails? {
        return venueDetailsDao.getVenueDetail(id: id)
    }
    
    func getVenueDetails() -> [VenueDetails]{
        return venueDetailsDao.getVenueDetails()
    }
}
