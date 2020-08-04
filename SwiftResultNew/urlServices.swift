//
//  urlServices.swift
//  swiftResultType
//
//  Created by Bhargava on 31/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
// MARK:- Both methods will work properly.
//struct DataUrl:Decodable{
//    var id: Int
//    var name : String
//    var username : String
//    var email : String
//    var phone : String
//    var website: String
//
//   var address : address?
//   var company : company?
//}
//struct address :Decodable{
//    let street:String
//    let suite:String
//    let city:String
//    let zipcode:String
//    let geo : geo?
//}
//struct geo:Decodable{
//    let lat:String
//    let lng:String
//}
//struct company: Decodable{
//    let name : String
//    let catchPhrase : String
//    let bs : String
//
//}

class DataUrl : Decodable{
    let id: Int?
       let name : String?
       let username : String?
       let email : String?
       let phone : String?
       let website: String?
    let address : addresses?
    let company : comapnies?

}
class addresses : Decodable{
    let street:String?
       let suite:String?
       let city:String?
       let zipcode:String?
    let geo : geos?
}
class geos : Decodable{
    let lat:String?
       let lng:String?

}
class comapnies:Decodable{
    let name : String?
    let catchPhrase : String?
    let bs : String?

}
