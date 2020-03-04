//
//  IVenueAmazingRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//


import Foundation
/// VenueAmazingRepository class for accessors to dao or mock implementation of retrieving and manipulating data
protocol IVenueAmazingRepository {
    
    
    func getVenueAmazingFromheaderId(secondaryId : String) -> [VenueAmazing]
    
    func getVenueAmazing(id : String) -> VenueAmazing?
    
    func getAllVenueAmazing() -> [VenueAmazing]
    
}
