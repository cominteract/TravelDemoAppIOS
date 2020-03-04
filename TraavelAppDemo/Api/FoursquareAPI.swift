//
//  FoursquareAPI.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/3/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class FoursquareAPI: ObservableObject {
    @Published var isLoading : Bool = false
    func getVenueItems(ll : String, completion:  @escaping (VenueExploreData?) -> ())
    {
        isLoading = true
        let session = URLSession.shared
        let url = URL(string: "\(Constants.BASE_API)\(Constants.VENUE_EXPLORE)&ll=\(ll)")!
        let task = session.dataTask(with: url) { data, response, error in
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }

                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }

                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }

                let decoder = JSONDecoder()
                if let data = data, let decoded = try? decoder.decode(VenueExploreData.self, from: data) {
                    print("Venue groups \(decoded.response)")
                    DispatchQueue.main.async { [weak self] in
                        self?.isLoading = false
                        completion(decoded)
                    }
                    
                }else {
                    DispatchQueue.main.async { [weak self] in
                        self?.isLoading = false
                        completion(nil)
                    }
                    print("Venue groups \(data)")
                    
                }
        }
        task.resume()
    }
    
    func getVenueDetails(id : String, completion:  @escaping (VenueData?) -> ())
    {
        isLoading = true
        let session = URLSession.shared
        let url = URL(string: "\(Constants.BASE_API)\(Constants.VENUE_DETAILS(id: id))")!
        let task = session.dataTask(with: url) { data, response, error in
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }

                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }

                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }

                let decoder = JSONDecoder()
                if let data = data, let decoded = try? decoder.decode(VenueData.self, from: data) {
                    print("Venue groups \(decoded)")
                    DispatchQueue.main.async { [weak self] in
                        self?.isLoading = false
                        completion(decoded)
                    }
                    
                }else {
                    print("Venue groups \(data)")
                    DispatchQueue.main.async { [weak self] in
                        self?.isLoading = false
                        completion(nil)
                    }
                    
                }
        }
        task.resume()
    }
}
