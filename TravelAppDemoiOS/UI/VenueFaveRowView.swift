//
//  VenueFaveRowView.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct VenueFaveRowView: View {
    
    var venueFave: VenueAndFavorites
    var body: some View {
        HStack(alignment: .center) {
            if self.venueFave.details != nil {
                WebImage(url: URL(string: self.venueFave.details!.url()))
                    .onSuccess { image, data, cacheType in
                 // Success
                }
                .placeholder {Rectangle().foregroundColor(.clear)
                    }.resizable()
                .renderingMode(.original)
                .scaledToFit()
                    .frame(width:110.0, height: 110.0, alignment: .trailing)
                Text(self.venueFave.details!.name).foregroundColor(.black).frame(width: 130.0, height: 25.0, alignment: .trailing)
            }
        }.frame(width: 300, height: 110, alignment: .center)
    }
}
