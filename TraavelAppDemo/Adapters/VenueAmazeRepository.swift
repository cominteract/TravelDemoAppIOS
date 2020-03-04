//
//  VenueAmazeRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//



import Foundation
/// VenueAmazeRepository class for accessors to dao or mock implementation of retrieving and manipulating data
class VenueAmazeRepository: IVenueAmazeRepository {
    var repoDao : VenueAmazeDao

    init(repoDao_ : VenueAmazeDao){
        repoDao = repoDao_

    }
    
    func getVenueAmazeFromvenueHeaderId(secondaryId : String) -> [VenueAmaze] {
        return repoDao.getVenueAmazeFromvenueHeaderId(secondaryId : secondaryId)
    }
    
    func getVenueAmaze(id : String) -> VenueAmaze? {
        return repoDao.getVenueAmaze(id : id)
    }
    
    func getAllVenueAmaze() -> [VenueAmaze] {
        return repoDao.getAllVenueAmaze()
    }
    
}
