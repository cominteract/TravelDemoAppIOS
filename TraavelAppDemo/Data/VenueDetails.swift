//
//  VenueDetails.swift
//  TraavelAppDemo
//
//  Created by Andre Insigne on 2/1/20.
//  Copyright © 2020 Andre Insigne. All rights reserved.
//

import UIKit
import RealmSwift
@objcMembers class VenueDetails : Object, Codable {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var location: VenueLocation? = nil
    dynamic var desc : String? = nil
    dynamic var likes : VenueLikes? = nil
    dynamic var bestPhoto : VenuePhotos? = nil
    dynamic var contact: VenueContact? = nil
    dynamic var headerLocation: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case location
        case likes
        case bestPhoto
        case contact
        case headerLocation
        case desc = "description"
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        location = try? container.decode(VenueLocation.self, forKey: .location)
        likes = try? container.decode(VenueLikes.self, forKey: .likes)
        bestPhoto = try? container.decode(VenuePhotos.self, forKey: .bestPhoto)
        contact = try? container.decode(VenueContact.self, forKey: .contact)
        headerLocation = try? container.decode(String.self, forKey: .headerLocation)
        desc = try? container.decode(String.self, forKey: .desc)
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

        if let width = bestPhoto?.width , let height = bestPhoto?.height, let prefix = bestPhoto?.prefix, let suffix = bestPhoto?.suffix {
            return "\(prefix)\(width)x\(height)\(suffix)"
        }else if let suffix = bestPhoto?.suffix{
            return "\(suffix)"
        }
        return ""
    }
}

@objcMembers class VenueContact : Object, Codable {
    dynamic var venueConId : String = UUID.init().uuidString
    dynamic var twitter : String? = nil
    dynamic var facebook : String? = nil
    dynamic var facebookUsername : String? = nil
    dynamic var facebookName : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case venueConId
        case twitter
        case facebook
        case facebookUsername
        case facebookName
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueConId = try container.decode(String.self, forKey: .venueConId)
        twitter = try? container.decode(String.self, forKey: .twitter)
        facebook = try? container.decode(String.self, forKey: .facebook)
        facebookName = try? container.decode(String.self, forKey: .facebookName)
        facebookUsername = try? container.decode(String.self, forKey: .facebookUsername)
        super.init()
    }
    
    required init()
    {
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "venueConId"
    }
}

@objcMembers class VenueLocation : Object, Codable {
    dynamic var venueLocId : String = UUID.init().uuidString
    dynamic var address : String? = nil
    dynamic var formattedAddress : String? = nil
    dynamic var lat : Double = 0.0
    dynamic var lng : Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case venueLocId
        case address
        case formattedAddress
        case lat
        case lng
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueLocId = try container.decode(String.self, forKey: .venueLocId)
        address = try? container.decode(String.self, forKey: .address)
        formattedAddress = try? container.decode(String.self, forKey: .formattedAddress)
        lat = try container.decode(Double.self, forKey: .lat)
        lng = try container.decode(Double.self, forKey: .lng)
        super.init()
    }
    
    required init()
    {
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "venueLocId"
    }
}

@objcMembers class VenueLikes : Object, Codable {
    dynamic var venueLikeId : String = UUID.init().uuidString
    dynamic var count : Int = 0
    dynamic var summary : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case venueLikeId
        case count
        case summary
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venueLikeId = try container.decode(String.self, forKey: .venueLikeId)
        summary = try? container.decode(String.self, forKey: .summary)
        count = try container.decode(Int.self, forKey: .count)
        super.init()
    }
    
    required init()
    {
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "venueLikeId"
    }
}

@objcMembers class VenuePhotos : Object, Codable {
    dynamic var venuePhotoId : String = UUID.init().uuidString
    dynamic var prefix : String = ""
    dynamic var suffix : String = ""
    dynamic var width : Int = 64
    dynamic var height : Int = 64
    

    
    enum CodingKeys: String, CodingKey {
        case venuePhotoId
        case prefix
        case suffix
        case width
        case height
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // venuePhotoId = try container.decode(String.self, forKey: .venuePhotoId)
        prefix = try container.decode(String.self, forKey: .prefix)
        suffix = try container.decode(String.self, forKey: .suffix)
        
        width = try container.decode(Int.self, forKey: .width)
        height = try container.decode(Int.self, forKey: .height)
        super.init()
    }
    
    required init()
    {
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "venuePhotoId"
    }
}


extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
