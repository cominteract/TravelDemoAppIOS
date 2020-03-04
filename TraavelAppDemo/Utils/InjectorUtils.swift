//
//  InjectorUtils.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/1/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class InjectorUtils: NSObject {
    static let shared = InjectorUtils()
    private func getDetailsRepository() -> VenueDetailsRepository{
        return VenueDetailsRepository.init(venueDetailsDao_: AppDatabase.shared.venueDetailsDao)
    }
    
    
    private func getVenueItemRepository() -> VenueItemRepository{
        return VenueItemRepository.init(venueItemDao_: AppDatabase.shared.venueItemsDao)
    }
    
    private func getVenueAndFaveRepository() -> VenueAndFavoritesRepository{
        return VenueAndFavoritesRepository.init(venueFaveDao_: AppDatabase.shared.venueFavesDao)
    }
    

    
    func provideVenueItemsViewModel() -> VenueItemsViewModel{
        let viewModel = VenueItemsViewModel(repo_: getVenueItemRepository())
        viewModel.getVenueItems()
        return viewModel
    }
    
    func provideVenueDetailsViewModel() -> VenueDetailsViewModel {
        return VenueDetailsViewModel(repo_: getDetailsRepository(), faveRepo_: getVenueAndFaveRepository())
    }
    
    func provideVenueFavesViewModel() -> VenueFavoritesViewModel {
        return VenueFavoritesViewModel(venueFaveRepository_: getVenueAndFaveRepository())
    }
    
    
    
    
}
