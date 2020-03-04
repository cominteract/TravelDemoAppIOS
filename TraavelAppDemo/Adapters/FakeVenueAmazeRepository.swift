//
//  FakeVenueAmazeRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//


import Foundation
/// VenueAmazeRepository class for accessors to dao or mock implementation of retrieving and manipulating data
class FakeVenueAmazeRepository: IVenueAmazeRepository {

    var items = [VenueAmaze]()
    
    init(){
        for i in 0..5{
            let item = VenueAmaze()
            item.venueAmazeId = "primary\(i)"
            item.venueHeaderId = "secondary\(i)"
            item.name = "modelProp1_\(i)"
            items.append(item)
        }
    }
    
    func getVenueAmazeFromvenueHeaderId(secondaryId : String) -> [VenueAmaze] {
        return items.filter({ $0.venueHeaderId ==  secondaryId})
    }
    
    func getVenueAmaze(id : String) -> VenueAmaze? {
        return items.filter({ $0.venueAmazeId == id  }).first
    }
    
    func getAllVenueAmaze() -> [VenueAmaze] {
        return items
    }
    
}
