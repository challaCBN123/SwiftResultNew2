//
//  ViewController.swift
//  SwiftResultNew
//
//  Created by Bhargava on 02/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
struct dataUrl:Decodable{
    var postId: Int
    var id: Int
   var name: String
   var email: String
    var body:String
}
struct datasUrl:Decodable{
    var id: Int
    var name : String
    var username : String
    var email : String
    var phone : String
    var website: String
    
}
enum PARAMETER_ENCODING{
    static let URL_ENCODING = "URLEncoding"
    static let JSON_ENCODING = "JSONEncoding"
}
class ViewController: UIViewController {
    var usersData = [DataUrl]()
    let baseUrl = "http://jsonplaceholder.typicode.com/users"
    // let baseUrl = "http://jsonplaceholder.typicode.com/comments"
     let endKey = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData.services.gettingDataUsingUrl(baseUrl: baseUrl, serviceUrl: endKey, parameter: ([String:String].self as? NSDictionary), encoding: PARAMETER_ENCODING.JSON_ENCODING) { (dataResponse) in
          
            switch dataResponse{
                       case .success(let details):
                           details.forEach { (dataUrl) in
                            print(dataUrl.address?.city ?? "")
                           }
                           break
                       case .failure(_):
                           print("failure")
                           break
                       }
            
        }
              }
    


}

