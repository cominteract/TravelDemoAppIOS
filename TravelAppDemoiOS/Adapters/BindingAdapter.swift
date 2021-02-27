//
//  BindingAdapter.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit
import Combine

class BindingAdapters: UIViewController {
    
    
    
    static func bindText(labelText : Published<String?>.Publisher , label : UILabel){
        labelText.receive(on: DispatchQueue.main)
            .assign(to: \.text, on: label)
    }
    
    static func bindEnabled(enabled : Published<Bool>.Publisher , button : UIButton){
        enabled.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: button)
    }
    
}
