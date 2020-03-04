//
//  VenueDetailView.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/3/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct VenueDetailView : View {
    @ObservedObject var venueFavesViewModel: VenueFavoritesViewModel =
    InjectorUtils.shared.provideVenueFavesViewModel()
    var venueId: String
    var origin: String
    @ObservedObject var foursquare: FoursquareAPI = FoursquareAPI()
    @ObservedObject var venueDetailsViewModel: VenueDetailsViewModel = InjectorUtils.shared.provideVenueDetailsViewModel()
    
    @State var isFavorited = false
    @State var selection: Int? = nil
    
    var body: some View {

            VStack(alignment: .center) {
                 if foursquare.isLoading {
                     LoadingView()
                 }
                 else{
                     if self.venueDetailsViewModel.venueDetails != nil{
                         WebImage(url: URL(string: self.venueDetailsViewModel.venueDetails!.url()))
                         .onSuccess { image, cacheType in
                             // Success
                             }.resizable()
                         .placeholder {Rectangle().foregroundColor(.gray)
                         }
                         .indicator(.activity) // Activity Indicator
                         .animation(.easeInOut(duration: 0.5)) // Animation Duration
                         .transition(.fade) // Fade Transition
                         .scaledToFit()
                         .frame(width: 550, height: 412, alignment: .center)
            
                         
                         
                         
                         Text(self.venueDetailsViewModel.venueDetails!.name).font(.largeTitle).frame(width: 400, alignment: .center)
                         .fixedSize(horizontal: false, vertical: true)
                        if self.venueDetailsViewModel.venueDetails!.desc != nil
                        {
                             Text(self.venueDetailsViewModel.venueDetails!.desc!).padding(5).font(.body).lineLimit(4).frame(width: 350, alignment: .center)
                             .fixedSize(horizontal: false, vertical: true)
                        }
                        if self.venueDetailsViewModel.venueDetails!.location != nil {
                            NavigationLink(destination: VenueMapView(origin: origin, destination: "\(self.venueDetailsViewModel.venueDetails!.location!.lat),\(self.venueDetailsViewModel.venueDetails!.location!.lng)"), tag: 1, selection: $selection) {
                                Button(action: {
                                    self.selection = 1
                                }) {
                                    HStack {
                                        Spacer()
                                        Text("ViewMap").foregroundColor(Color.white).bold()
                                        Spacer()
                                    }
                                }
                                .accentColor(Color.black)
                                .padding()
                                .background(Color(UIColor.darkGray))
                                .cornerRadius(4.0)
                                .padding(Edge.Set.vertical, 20)
                            }
                        }
                     }
                 }
             }.frame(width: 350, height: 90, alignment: .center).padding(8).onAppear(){
                 self.venueDetailsViewModel.getVenueDetail(id: self.venueId)
                 if self.venueDetailsViewModel.venueDetails == nil{
                     self.foursquare.getVenueDetails(id: self.venueId) { (venueData) in

                         if let venueData = venueData, let venueDetails = venueData.response?.venue{
                             self.venueDetailsViewModel.repo.insert(venueDetails: venueDetails)
                             self.venueDetailsViewModel.getVenueDetail(id: self.venueId)
                         }
                     }
                 }
             }.navigationBarItems(trailing:
                     barItem
             ).onAppear(){
                 self.isFavorited = self.venueFavesViewModel.isFavorited(venueId: self.venueId)
             }
    }
    
    var barItem: some View {
        if isFavorited{
            return Button(action: {
                                     print(" Already Added ")
                                 }){
                                     Image(systemName: "star").imageScale(.large)
                    }
            
        }else{
            return Button(action: {
                self.venueDetailsViewModel.addVenueToFave()
                self.venueFavesViewModel.refresh()
                
                     }){
                         Image(systemName: "plus").imageScale(.large)
            }
        }
    }
}

