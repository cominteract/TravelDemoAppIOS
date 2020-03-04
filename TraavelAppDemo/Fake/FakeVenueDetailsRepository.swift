//
//  FakeVenueDetailsRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 3/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class FakeVenueDetailsRepository: DetailRepository {
    var allDetails = [VenueDetails]()
    init() {
        generateVenueDetails()
    }
    
    func generateVenueDetails(){
        if allDetails.isEmpty{
            for i in 0..<allDetails.count {
                let venueDetails = VenueDetails()
                venueDetails.id = Constants.VenueIDSList[i]
                venueDetails.name = Constants.VenueNamesList[i]
                venueDetails.desc = Constants.VenueDescList[i]
                venueDetails.bestPhoto = VenuePhotos()
                venueDetails.bestPhoto?.suffix = Constants.VenuePicsList[i]
                allDetails.append(venueDetails)
                
            }
        }
    }
    
    func insert(venueDetails: VenueDetails) {
        allDetails.append(venueDetails)
    }
    
    func getVenueDetails() -> [VenueDetails] {
        return allDetails
    }
    
    func getVenueDetail(id: String) -> VenueDetails? {
        return allDetails.filter({ $0.id == id  }).first
    }
    
    func getVenueDetailsWithLocation(headerLocation: String) -> [VenueDetails] {
        return allDetails.filter({ $0.headerLocation == headerLocation })
    }
    
    
}
