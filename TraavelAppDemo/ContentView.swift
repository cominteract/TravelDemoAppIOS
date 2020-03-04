//
//  ContentView.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 1/31/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import SwiftUI
import CoreLocation
struct ContentView: View{
    
    @ObservedObject var foursquare: FoursquareAPI = FoursquareAPI()
    @ObservedObject var venueItemsViewModel: VenueItemsViewModel = InjectorUtils.shared.provideVenueItemsViewModel()
    @ObservedObject var venueFavesViewModel: VenueFavoritesViewModel =
        InjectorUtils.shared.provideVenueFavesViewModel()
    @State var isFave = false
    
    
    
    
    let travelLocation = TravelLocations()
    @ObservedObject var locationManager = LocationManager()
    var lat: Double  { return locationManager.location?.coordinate.latitude ?? 14.588810 }
    var lon: Double { return locationManager.location?.coordinate.longitude ?? 121.063843 }
    
  
    
    
    func startAPI(){
        self.foursquare.getVenueItems(ll: LocationUtils.locationQuery(lat: self.lat,lon: self.lon)) { (venueExploreData) in
            
            if let venueExploreData = venueExploreData, let items = venueExploreData.response?.groups[0].items{
                let latLng = LocationUtils.locationQuery(lat: self.lat, lon: self.lon)
                for item in items{
                    item.latLng = latLng
                }
                if let items2 = venueExploreData.response?.groups[0].items{
                    for item in items2{
                        print(" \(item.latLng)")
                    }
                }
                
                self.venueItemsViewModel.repo.insertTravelLocations(travelLocations: self.travelLocation)
                self.venueItemsViewModel.repo.insertAll(venueExploreData: venueExploreData)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if foursquare.isLoading {
                    LoadingView()
                } else if isFave{
                   List(self.venueFavesViewModel.venueAndFavorites) { (venueAndFave: VenueAndFavorites) in
                       if venueAndFave.details != nil{
                           NavigationLink(destination:
                           VenueDetailView(venueId: venueAndFave.details!.id , origin : "\(self.lat),\(self.lon)" )) {
                               VenueFaveRowView(venueFave : venueAndFave)
                           }
                       }
                   }
                }
                else if !isFave{
                    
                    List(self.venueItemsViewModel.venueItems) { (venueItem: VenueItem) in
                                           if venueItem.venue != nil{
                                               NavigationLink(destination:
                                               VenueDetailView(venueId: venueItem.venue!.id, origin : "\(self.lat),\(self.lon)")) {
                                                   VenueItemRowView(venueItem: venueItem).padding(3)
                                               }.background(Color.gray)
                                           }
                    }
                }
            }
            .navigationBarTitle(Constants.title)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isFave.toggle()
                }) {
                    Image(systemName: "bookmark").imageScale(.large)
                }
            ).onAppear(){
                print(" NavView Group  Appeared ")
                self.venueFavesViewModel.refresh()
            }
            
        }
        .onAppear(){
            
      
            self.travelLocation.lat = self.lat
            self.travelLocation.lon = self.lon
            
            if self.venueItemsViewModel.venueItems.isEmpty {
                let db = AppDatabase.shared
                
                
                
                if LocationUtils.isAlreadyChecked(lat: self.lat, lon: self.lon, items: db.travelLocations().toArray()) && LocationUtils.isClose(lat: self.lat, lon: self.lon, items: db.travelLocations().toArray()){
                }else{
                    self.startAPI()
                }
                self.venueItemsViewModel.getNearbyVenueItems(travelLocations: self.travelLocation)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
