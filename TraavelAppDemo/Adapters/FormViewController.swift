//
//  FormViewController.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/17/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @Published var isSubmitAllowed: Bool = false
    @Published var submitText : String? = ""
    
    @IBOutlet private weak var acceptTermsSwitch: UISwitch!
    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var textLabel: UILabel!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //$isSubmitAllowed.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: submitButton)
        BindingAdapters.bindEnabled(enabled: $isSubmitAllowed, button: submitButton)
        BindingAdapters.bindText(labelText: $submitText, label: textLabel)
        
    }

    @IBAction func didSwitch(_ sender: UISwitch) {
        isSubmitAllowed = sender.isOn
    }
}
