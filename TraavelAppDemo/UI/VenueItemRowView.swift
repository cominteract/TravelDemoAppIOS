//
//  VenueItemRowView.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/3/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct VenueItemRowView: View {
    
    var venueItem: VenueItem
  
    
    var body: some View {
        VStack(alignment: .center) {
            if self.venueItem.venue != nil {
                WebImage(url: URL(string: self.venueItem.venue!.url()))
                    .onSuccess { image, cacheType in
                 // Success
                }
                .placeholder {Rectangle().foregroundColor(.init(red: 66.0, green: 66.0, blue: 66.0))
                }
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 64, height: 64, alignment: .center)
                Text(self.venueItem.venue!.name).foregroundColor(.white)
            }
        }.frame(width: 350, height: 90, alignment: .center)
    }
}
