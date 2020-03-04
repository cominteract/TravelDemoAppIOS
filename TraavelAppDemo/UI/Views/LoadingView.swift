//
//  LoadingView.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/3/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//


import SwiftUI

struct LoadingView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LoadingView>) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingView>) {
        uiView.startAnimating()
    }
}
