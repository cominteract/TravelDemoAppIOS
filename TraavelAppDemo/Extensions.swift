//
//  Extensions.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/4/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift
class Extensions: NSObject {

}
extension Results {
func toArray() -> [Element] {
  return compactMap {
    $0
    }
}
}
