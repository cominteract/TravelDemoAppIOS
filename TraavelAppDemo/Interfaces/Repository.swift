//
//  Repository.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/12/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

protocol DetailRepository {
    func getVenueDetails() -> [VenueDetails]
    func getVenueDetail(id : String) -> VenueDetails?
    func getVenueDetailsWithLocation(headerLocation : String) -> [VenueDetails]
    func insert(venueDetails: VenueDetails)
}

protocol ItemRepository {
    func getNearbyVenueItems(travelLocations : TravelLocations) -> [VenueItem]
    
    func getVenueItems() -> [VenueItem]
    func getVenueItem(venueName : String) -> VenueItem?
    func getTravelLocations() -> [TravelLocations]
    func insertVenueItem(venueItem: VenueItem)
    func insertTravelLocations(travelLocations : TravelLocations)
    func insertAll(venueExploreData : VenueExploreData)
}

protocol FaveRepository {
    func createVenueFavorites(details : VenueDetails)

    func removeVenueFavorites(venueFavorites: VenueFavorites)

    func getVenueFavorites() -> [VenueFavorites]

    func getVenueAndFavorites() -> [VenueAndFavorites]
}
