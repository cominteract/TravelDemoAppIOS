//
//  VenueItemsViewModel.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit
import RealmSwift
class VenueItemsViewModel: ObservableObject {
    @Published var venueItems : [VenueItem] = [VenueItem]()
    @Published var nearbyVenueItems : [VenueItem] = [VenueItem]()
    
    var repo : VenueItemRepository
    init(repo_ : VenueItemRepository) {
        repo = repo_
    }
    func getNearbyVenueItems(travelLocations : TravelLocations){
        self.nearbyVenueItems = repo.getNearbyVenueItems(travelLocations: travelLocations)
    }
    func getVenueItems(){
        self.venueItems = repo.getVenueItems()
        
//        foursquareAPI.getVenueItems(ll: ll) { [weak self] (venueExplore) in
//            if let venueExplore = venueExplore, let items = venueExplore.response?.groups[0].items{
//                self?.venueItems = items
//            }
//        }
    }
}

