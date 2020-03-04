//
//  BindingAdapters.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/17/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
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
