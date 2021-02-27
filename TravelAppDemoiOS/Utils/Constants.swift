//
//  Constants.swift
//  TravelAppDemoiOS
//
//  Created by Klein Noctis on 2/26/21.
//  Copyright © 2021 Klein Noctis. All rights reserved.
//

import UIKit
import CoreLocation
class Constants: NSObject {
    static let BASE_API = "https://api.foursquare.com/v2/"
    static let CLIENT_ID = "1OQZTKC4DEVC4TG21RN4FAWEJSAL41TMOFUD4QFB3SLDK2QH"
    static let CLIENT_SECRET = "AIKG0GVNTNCWX02KX21Y5NEGDDSQ5Z1C35LJ3YNIKALSHSO5"
    static let V = "20190323"
    static let title = "TravelAppDemo"
    static let VENUE_EXPLORE = "venues/explore?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=\(V)"
    static let API_KEY = "AIzaSyB2EGlCGdsc_LxEoVI2SO7eVZjnaTinPmg"
    static let GOOGLE_DIRECTIONS = "json?key=\(API_KEY)"
    
    static func VENUE_DETAILS(id : String) -> String{
        return "venues/\(id)?venuePhotos=5&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=\(V)"
    }
    static let GOOGLE_BASE_API = "https://maps.googleapis.com/maps/api/directions/"
    static let randomLatLng = Array<CLLocation>(arrayLiteral:
        CLLocation.init(latitude: 14.593652, longitude: 121.058283),
        CLLocation.init(latitude: 14.572553, longitude: 121.047125),
        CLLocation.init(latitude: 14.588999, longitude: 121.102228),
        CLLocation.init(latitude: 14.535250, longitude: 121.046438),
        CLLocation.init(latitude: 14.522621, longitude: 121.017427),
        CLLocation.init(latitude: 14.539820, longitude: 121.015367),
        CLLocation.init(latitude: 14.561420, longitude: 121.016912),
        CLLocation.init(latitude: 14.533090, longitude: 120.992966),
        CLLocation.init(latitude: 14.506834, longitude: 121.042661),
        CLLocation.init(latitude: 14.487501, longitude: 120.992211))
    static let VenuePicsList = Array<String>(arrayLiteral: "https://fastly.4sqi.net/img/general/1440x1440/382040_MOkTPrR_2bsZ8U4tpxXksFlWIQDDFNckIWx_unJW-bQ.jpg"
    ,"https://fastly.4sqi.net/img/general/1440x1920/95838_m7BYaJiEyxCa44l_CvzCjXcIkWELkpoooSvhz_LBQ6s.jpg"
    ,"https://fastly.4sqi.net/img/general/612x612/29356_svAav_lODiheJmpy1lp42uWfsjWUxOeQWghLWYL-taw.jpg"
    ,"https://fastly.4sqi.net/img/general/1440x1920/30792_zHt4UNtxE5YuygLK3MfRW0FRZIEeD4ZcSO6_9bEpbwI.jpg"
    ,"https://fastly.4sqi.net/img/general/960x720/50067380_lud8mXI706CfRfSD15hy1NrmQzfwHGVyM_yRXKfR2Vw.jpg"
    ,"https://fastly.4sqi.net/img/general/1500x1000/39158326_LBkGwYTvD0W8x8-900U0xNHuyQL2aXbCUNJhmYQrChM.jpg"
    ,"https://fastly.4sqi.net/img/general/612x612/2825916_H_bQ7l_wmuusXNfKC9rOJKaAtY9xOfs2QHFSVSyarp8.jpg"
    ,"https://fastly.4sqi.net/img/general/540x720/ICGFGF0JJ0HVXNWWOJ3MIJRKDYYUU5L1GF3ALJNV1A5JH0A1.jpg"
    ,"https://fastly.4sqi.net/img/general/610x458/20902261_pnuwMwg6Sy8j4f-riRALZPblMpQ0cRGADLXWlNlwJCs.jpg")
    static let VenueIconsList = Array<String>(arrayLiteral: "https://ss3.4sqi.net/img/categories_v2/food/snacks_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/food/sushi_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/food/streetfood_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/shops/technology_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/food/tapas_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/shops/salon_barber_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/food/french_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/shops/apparel_boutique_64.png"
    ,"https://ss3.4sqi.net/img/categories_v2/food/bakery_64.png")
    static let  VenueDescList = Array<String>(arrayLiteral: "A 1st-of-its-kind Mediterranean yogurt bar by the makers of Chobani Greek Yogurt, " +
        "America's #1 yogurt brand. Menu items feature Chobani, served chilled (not frozen!) and complemented by artisanal ingredients." +
        " Grab fresh fruit from the Harvest Table and specialty goods from the Mediterranean Pantry!"
    ,"","","Sonos Home Sound System: All the music on earth, in every room, wirelessly."

    ,"Lively, Barcelona-style tapas bar serving a menu of Spanish classics—like paella, churros, sangria, pulpo, " +
            "and much more— and market-driven seasonal specials in a warm, modern space in NYC's SOHO district."
    ,"Located in the heart of SoHo, Sam Brocato Salon is a trendsetting, industrial-chic style destination."
    ,"Two brothers journeyed from France to Soho. Serge stood outside importuning passersby to enter and taste. The rest is New York bistro history."
    ,"Designer, visionary, artist, Gabrielle ‘Coco’ Chanel reinvented fashion by transcending its conventions, creating an uncomplicated luxury that changed women’s lives forever. " +
            "She followed no rules, epitomising the very modern values of freedom, passion and feminine elegance."
    ,"Dominique Ansel Bakery was awarded Time Out New York’s “Best Bakery of 2012” and Metromix’s “Best Bakery of 2012”. " +
            "Today, it is also Zagat 2013’s highest ranked bakery with 27 points awarded for food. " +
            "In 2013, he was nominated as a James Beard Award semifinalist for Outstanding Pastry Chef.")
    static let VenueNamesList = Array<String>(arrayLiteral: "Chobani","SUGARFISH by sushi nozawa","Calexico Cart","Sonos","Boqueria", "Sam Brocato Salon"
    ,"Raoul's Restaurant", "CHANEL","Dominique Ansel Bakery")
    static let VenueIDSList = Array<String>(arrayLiteral: "1","2","3",
    "4","5", "6",
    "7","8","9")
    static let VenueDetailID = "10"
    static let VenueDetailName = "Dominique Ansel Bakery"
    static let VenueDetailDesc = "Dominique Ansel Bakery was awarded Time Out New York’s “Best Bakery of 2012” and Metromix’s “Best Bakery of 2012”. " +
            "Today, it is also Zagat 2013’s highest ranked bakery with 27 points awarded for food. " +
            "In 2013, he was nominated as a James Beard Award semifinalist for Outstanding Pastry Chef."
    static let VenueDetailPic = "https://fastly.4sqi.net/img/general/610x458/20902261_pnuwMwg6Sy8j4f-riRALZPblMpQ0cRGADLXWlNlwJCs.jpg"
    static let  VenueDetailIcon = "https://ss3.4sqi.net/img/categories_v2/food/bakery_64.png"

}
