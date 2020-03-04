//
//  CustomMapView.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 3/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    let mapViewDelegate = MapViewDelegate()
    @State var routeList: [CLLocationCoordinate2D]?
    @State var markerList: [MKPointAnnotation]?
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = mapViewDelegate                          // (1) This should be set in makeUIView, but it is getting reset to `nil`
        view.translatesAutoresizingMaskIntoConstraints = false   // (2) In the absence of this, we get constraints error on rotation; and again, it seems one should do this in makeUIView, but has to be here
        if !view.overlays.isEmpty {
            view.removeOverlays(view.overlays)
        }
        if let routeList = routeList, let markerList = markerList{
            let geodesic = MKGeodesicPolyline(coordinates: routeList, count: routeList.count)
            view.addOverlay(geodesic)
            view.addAnnotations(markerList)
            UIView.animate(withDuration: 1.5, animations: { () -> Void in
                        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        let region1 = MKCoordinateRegion(center: routeList[0], span: span)
                        
                        view.setRegion(region1, animated: true)
            })
        }
        
    }
}

private extension MapView {
    func addRoute(to view: MKMapView) {
//        if !view.overlays.isEmpty {
//            view.removeOverlays(view.overlays)
//        }
//
//        guard let route = route else { return }
//        let mapRect = route.boundingMapRect
//        view.setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
//        view.addOverlay(route)
    }
}

class MapViewDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.red.withAlphaComponent(0.8)
        return renderer
    }
}
