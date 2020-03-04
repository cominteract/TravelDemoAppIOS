//
//  IVenueAmazeRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//


import Foundation
/// VenueAmazeRepository class for accessors to dao or mock implementation of retrieving and manipulating data
protocol IVenueAmazeRepository {
    
    
    func getVenueAmazeFromvenueHeaderId(secondaryId : String) -> [VenueAmaze]
    
    func getVenueAmaze(id : String) -> VenueAmaze?
    
    func getAllVenueAmaze() -> [VenueAmaze]
    
}
