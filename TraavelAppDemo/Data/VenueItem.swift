    //
    //  VenueItem.swift
    //  TraavelAppDemo
    //
    //  Created by Andre Insigne on 2/3/20.
    //  Copyright © 2020 Andre Insigne. All rights reserved.
    //

    import UIKit
    import RealmSwift
    import Realm
    @objcMembers class VenueItem: Object, Codable {
        dynamic var venueItemId : String = UUID().uuidString
        dynamic var venue : Venue? = nil
        dynamic var latLng = "0.0,0.0"
        enum CodingKeys: String, CodingKey {
            case venueItemId
            case venue
        }
        
        override static func primaryKey() -> String?
        {
            return "venueItemId"
        }
        
        required init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            // venueItemId = try container.decode(String.self, forKey: .venueItemId)
            
            venue = try container.decode(Venue.self, forKey: .venue)
            
            super.init()
        }
        
        required init() {
            super.init()
        }
        
    }

    @objcMembers class TravelLocations: Object {
        dynamic var locationId : Int = -1
        dynamic var lat : Double = 0.0
        dynamic var lon : Double = 0.0
    }

    @objcMembers class Venue: Object, Codable {
        dynamic var id : String = ""
        dynamic var name : String = ""
        //dynamic var categories : RealmSwift.List<VenueCategories>
        let categories = RealmSwift.List<VenueCategories>()
        
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case categories
        }
        
        required init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(String.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            let categoriesList = try container.decode([VenueCategories].self, forKey: .categories)
            categories.append(objectsIn: categoriesList)
            super.init()
        }
        
        required init()
        {
               super.init()
        }
        
        override static func primaryKey() -> String?
        {
            return "id"
        }
        
        func url() -> String {
            if categories.count > 0, let icon = categories[0].icon {
                
                return "\(icon.prefix)64\(icon.suffix)"
            }
            return ""
        }
        
    }

    @objcMembers class VenueCategories : Object, Codable {
        dynamic var name : String = ""
        dynamic var pluralName : String = ""
        dynamic var shortName : String = ""
        dynamic var icon : VenueIcon? = nil
        dynamic var id : String = ""
        dynamic var venueCategoryId = UUID.init().uuidString
        enum CodingKeys: String, CodingKey {
            case venueCategoryId
            case id
            case name
            case pluralName
            case shortName
            case icon
        }
        
        required init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(String.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            pluralName = try container.decode(String.self, forKey: .pluralName)
            shortName = try container.decode(String.self, forKey: .shortName)
            icon = try? container.decode(VenueIcon.self, forKey: .icon)
    
            super.init()
        }
        
        override static func primaryKey() -> String?
        {
            return "venueCategoryId"
        }
        
        required init()
        {
            super.init()
        }
        
    }

    @objcMembers class VenueIcon : Object, Codable {
        dynamic var venueIconId : String = UUID().uuidString
        dynamic var prefix : String = ""
        dynamic var suffix : String = ""
        
        
        enum CodingKeys: String, CodingKey {
                case venueIconId
                case prefix
                case suffix
            }
            
            required init(from decoder: Decoder) throws
            {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                // venueIconId = try container.decode(String.self, forKey: .venueIconId)
                prefix = try container.decode(String.self, forKey: .prefix)
                suffix = try container.decode(String.self, forKey: .suffix)
      
                super.init()
            }
            
            override static func primaryKey() -> String?
            {
                return "venueIconId"
            }
            
            required init()
            {
                super.init()
            }
    }

    extension VenueItem : Identifiable {
        public var id : String { venueItemId }
        

    }
