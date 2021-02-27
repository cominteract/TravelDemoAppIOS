//
//  VenueItemRowView.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct VenueItemRowView: View {
    
    var venueItem: VenueItem
  
    
    var body: some View {
        VStack(alignment: .center) {
            if self.venueItem.venue != nil {
                WebImage(url: URL(string: self.venueItem.venue!.url()))
                    .onSuccess { image, data, cacheType in
                 // Success
                }
                .placeholder {Rectangle().foregroundColor(.init(red: 66.0, green: 66.0, blue: 66.0))
                }
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: CGFloat(64.0), height: CGFloat(64.0), alignment: .center)
                Text(self.venueItem.venue!.name).foregroundColor(.white)
            }
        }.frame(width: 350, height: 90, alignment: .center)
    }
}
