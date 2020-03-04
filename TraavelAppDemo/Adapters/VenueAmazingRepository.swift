//
//  VenueAmazingRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//



import Foundation
/// VenueAmazingRepository class for accessors to dao or mock implementation of retrieving and manipulating data
class VenueAmazingRepository: IVenueAmazingRepository {
    var repoDao : VenueAmazingDao

    init(repoDao_ : VenueAmazingDao){
        repoDao = repoDao_

    }
    
    func getVenueAmazingFromheaderId(secondaryId : String) -> [VenueAmazing] {
        return repoDao.getVenueAmazingFromheaderId(secondaryId : secondaryId)
    }
    
    func getVenueAmazing(id : String) -> VenueAmazing? {
        return repoDao.getVenueAmazing(id : id)
    }
    
    func getAllVenueAmazing() -> [VenueAmazing] {
        return repoDao.getAllVenueAmazing()
    }
    
}
