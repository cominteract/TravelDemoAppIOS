//
//  FakeVenueAmazingRepository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/18/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//




import Foundation
/// VenueAmazingRepository class for accessors to dao or mock implementation of retrieving and manipulating data
class FakeVenueAmazingRepository: IVenueAmazingRepository {

    var items = [VenueAmazing]()
    
    init(){
        for i in 0..5{
            let item = VenueAmazing()
            item.amazingId = "primary\(i)"
            item.headerId = "secondary\(i)"
            item.name = "modelProp1_\(i)"
            items.append(item)
        }
    }
    
    func getVenueAmazingFromheaderId(secondaryId : String) -> [VenueAmazing] {
        return items.filter({ $0.headerId ==  secondaryId})
    }
    
    func getVenueAmazing(id : String) -> VenueAmazing? {
        return items.filter({ $0.amazingId == id  }).first
    }
    
    func getAllVenueAmazing() -> [VenueAmazing] {
        return items
    }
    
}
