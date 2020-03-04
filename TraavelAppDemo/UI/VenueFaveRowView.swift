//
//  VenueFaveRowView.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/14/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct VenueFaveRowView: View {
    
    var venueFave: VenueAndFavorites
    var body: some View {
        HStack(alignment: .center) {
            if self.venueFave.details != nil {
                WebImage(url: URL(string: self.venueFave.details!.url()))
                    .onSuccess { image, cacheType in
                 // Success
                }
                .placeholder {Rectangle().foregroundColor(.clear)
                    }.resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 110, height: 110, alignment: .trailing)
                Text(self.venueFave.details!.name).foregroundColor(.black).frame(width: 130, height: 25, alignment: .trailing)
            }
        }.frame(width: 300, height: 110, alignment: .center)
    }
}
