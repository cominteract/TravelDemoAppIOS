//
//  InjectorUtils.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit

class InjectorUtils {
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
