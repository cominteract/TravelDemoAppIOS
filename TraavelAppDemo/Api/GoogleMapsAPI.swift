//
//  GoogleMapsAPI.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 3/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class GoogleMapsAPI: ObservableObject {

    func getDirections(origin : String, destination : String , completion:  @escaping (GoogleDirectionsData?) -> ())
    {
        let session = URLSession.shared
        let urlString = "\(Constants.GOOGLE_BASE_API)\(Constants.GOOGLE_DIRECTIONS)&origin=\(origin)&destination=\(destination )"
        let url = URL(string: urlString)!
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
                if let data = data, let decoded = try? decoder.decode(GoogleDirectionsData.self, from: data) {
                    print("Google Directions \(decoded.routes.count) \(decoded.routes[0].legs[0].steps[0].distance)")
                    DispatchQueue.main.async { [weak self] in
          
                        completion(decoded)
                    }
                    
                }else {
                    DispatchQueue.main.async { [weak self] in
                      
                        completion(nil)
                    }
                    print("Google Directions \(response)")
                    
                }
        }
        task.resume()
    }
}
