//
//  VenueExploreData.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/3/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

@objcMembers class VenueExploreData:  Object, Codable {
    dynamic var venueExploreId : String = UUID.init().uuidString
    dynamic var response : VenueExploreResponse? = nil
    enum CodingKeys: String, CodingKey {
        case venueExploreId
        case response
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // venueExploreId = try container.decode(String.self, forKey: .venueExploreId)
  
        response = try? container.decode(VenueExploreResponse.self, forKey: .response)
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "venueExploreId"
    }
    
    required init()
    {
        super.init()
    }
}

@objcMembers class VenueExploreResponse : Object, Codable {
    dynamic var venueExploreResponseId : String = UUID.init().uuidString
    dynamic var totalResults : Int = 0
    let groups = RealmSwift.List<VenueGroups>()
    
    enum CodingKeys: String, CodingKey {
 
        case totalResults
        case groups
        case venueExploreResponseId
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueExploreResponseId = try container.decode(String.self, forKey: .venueExploreResponseId)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        let groupsList = try container.decode([VenueGroups].self, forKey: .groups)
        groups.append(objectsIn: groupsList)
        super.init()
    }
      
    override static func primaryKey() -> String?
    {
        return "venueExploreResponseId"
    }
      
    required init()
    {
        super.init()
    }
    
}

@objcMembers class VenueGroups : Object, Codable {
    dynamic var venueGroupId : String = UUID.init().uuidString
    dynamic var type : String = ""
    dynamic var name : String = ""
    let items = RealmSwift.List<VenueItem>()
    
    enum CodingKeys: String, CodingKey {
        case venueGroupId
        case type
        case name
        case items
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueGroupId = try container.decode(String.self, forKey: .venueGroupId)
        type = try container.decode(String.self, forKey: .type)
        name = try container.decode(String.self, forKey: .name)
        let itemsList = try container.decode([VenueItem].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }
      
    override static func primaryKey() -> String?
    {
        return "venueGroupId"
    }
      
    required init()
    {
        super.init()
    }
}

@objcMembers class VenueData: Object, Codable {
    dynamic var venueDataId : String = UUID.init().uuidString
    dynamic var response : VenueResponse? = nil
    
    enum CodingKeys: String, CodingKey {
        case venueDataId
        case response
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueDataId = try container.decode(String.self, forKey: .venueDataId)
        response = try? container.decode(VenueResponse.self, forKey: .response)
        super.init()
    }
      
    override static func primaryKey() -> String?
    {
        return "venueDataId"
    }
      
    required init()
    {
        super.init()
    }
}

@objcMembers class VenueResponse: Object, Codable {
    dynamic var venueResponseId : String = UUID.init().uuidString
    dynamic var venue : VenueDetails? = nil
    
    enum CodingKeys: String, CodingKey {
        case venueResponseId
        case venue
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueResponseId = try container.decode(String.self, forKey: .venueResponseId)
        venue = try? container.decode(VenueDetails.self, forKey: .venue)
        super.init()
    }
      
    override static func primaryKey() -> String?
    {
        return "venueResponseId"
    }
      
    required init()
    {
        super.init()
    }
}

