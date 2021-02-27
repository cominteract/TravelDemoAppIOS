//
//  VenueMapView.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import MapKit
struct VenueMapView: View {
    @State var route: MKPolyline?
    @State var data: GoogleDirectionsData?
    var googleApi = GoogleMapsAPI()
    var origin: String
    var destination: String
    var body: some View {
        VStack(alignment: .center){
            if self.data != nil{
                MapView(routeList: GoogleDirectionsData.convertDataToPolylineWithPoly(data: self.data!), markerList: GoogleDirectionsData.convertDataToPolylineWithMarker(data: self.data!)).onAppear(){
                }
            }
        }.onAppear(){
            self.googleApi.getDirections(origin: self.origin, destination: self.destination) { ( data ) in
                self.data = data
            }
        }
    }
}



private extension VenueMapView {
    func findCoffee() {
        let start = CLLocationCoordinate2D(latitude: 37.332693, longitude: -122.03071)
        let region = MKCoordinateRegion(center: start, latitudinalMeters: 2000, longitudinalMeters: 2000)

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "coffee"
        request.region = region

        MKLocalSearch(request: request).start { response, error in
            guard let destination = response?.mapItems.first else { return }

            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
            request.destination = destination
            MKDirections(request: request).calculate { directionsResponse, _ in
                self.route = directionsResponse?.routes.first?.polyline
            }
        }
    }
}
