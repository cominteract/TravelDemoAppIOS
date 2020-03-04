//
//  VenueDetailViewModel.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class VenueDetailsViewModel: ObservableObject {
    @Published var venueDetails : VenueDetails? = nil
    var detailId : String = ""
    var repo : DetailRepository
    var faveRepo : FaveRepository
    init(repo_ : VenueDetailsRepository, faveRepo_ : VenueAndFavoritesRepository) {
        repo = repo_
        faveRepo = faveRepo_
    }
    func getVenueDetail(id : String){
        self.detailId = id
        self.venueDetails = repo.getVenueDetail(id: id)
    }
    
    func addVenueToFave(){
        if let details = self.venueDetails{
            faveRepo.createVenueFavorites(details: details)
        }
    }
}
