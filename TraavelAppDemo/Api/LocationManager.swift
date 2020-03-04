//
//  LocationManager.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 3/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//


import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate , ObservableObject{
    
    let manager: CLLocationManager
    @Published var status: CLAuthorizationStatus? {
      willSet { objectWillChange.send() }
    }

    @Published var location: CLLocation? {
      willSet { objectWillChange.send() }
    }

    override init() {
        self.manager = CLLocationManager()

        super.init()
        self.manager.delegate = self
        getlocationForUser()
    }
    
    //This is the main method for getting the users location and will pass back the usersLocation when it is available
    func getlocationForUser() {
        
 
        
        //First need to check if the apple device has location services availabel. (i.e. Some iTouch's don't have this enabled)
        if CLLocationManager.locationServicesEnabled() {
            //Then check whether the user has granted you permission to get his location
            if CLLocationManager.authorizationStatus() == .notDetermined {
                //Request permission
                //Note: you can also ask for .requestWhenInUseAuthorization
                manager.requestWhenInUseAuthorization()
            } else if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied {
                //... Sorry for you. You can huff and puff but you are not getting any location
            } else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                // This will trigger the locationManager:didUpdateLocation delegate method to get called when the next available location of the user is available
                manager.startUpdatingLocation()
            }
        }
        
    }
    
    //MARK: CLLocationManager Delegate methods
    
    @objc func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        //Because multiple methods might have called getlocationForUser: method there might me multiple methods that need the users location.
        //These userLocation closures will have been stored in the locationManagerClosures array so now that we have the users location we can pass the users location into all of them and then reset the array.
        self.location = newLocation
    }
}
