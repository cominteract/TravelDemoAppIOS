//
//  Extensions.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
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
