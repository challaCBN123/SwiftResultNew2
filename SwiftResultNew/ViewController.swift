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

enum PARAMETER_ENCODING{
    static let URL_ENCODING = "URLEncoding"
    static let JSON_ENCODING = "JSONEncoding"
}
class ViewController: UIViewController {
    @IBOutlet weak var tblView:UITableView!
    var arraySerach: [DataUrl] = []
    let baseUrl = "http://jsonplaceholder.typicode.com/users"
    // let baseUrl = "http://jsonplaceholder.typicode.com/comments"
     let endKey = ""
       let baseURLString = "https://developers.zomato.com/api/v2.1/geocode?lat=16.515099&lon=80.632095"
      let apiKey = "c56ce01dafd40a68e12e336e50d91e0b"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
              }
    
    func getdata(){
        //let header:HTTPHeaders = ["Content-Type":"application/json","User-Key":apiKey]
                GetData.services.gettingDataUsingUrl(baseUrl: baseUrl, serviceUrl: endKey, parameter: ([String:String].self as? NSDictionary), encoding: PARAMETER_ENCODING.JSON_ENCODING) { (dataResponse) in
                  
                    switch dataResponse{
                               case .success(let details):
                                   details.forEach { (dataUrl) in
                                    //print(dataUrl.address?.city ?? "")
                                   // self.usersData.append(dataUrl)
        
                                   }
                                self.arraySerach = details
                                   self.tblView.reloadData()
                                   break
                               case .failure(_):
                                   print("failure")
                                   break
                               }
                    
                }
    }
}
extension ViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySerach.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        let dict = arraySerach[indexPath.row]
       
        cell.nameLbl.text = dict.name ?? ""
        cell.cityLbl.text = dict.address?.city ?? ""
        cell.pinLbl.text = dict.address?.zipcode ?? ""
        return cell
    }
    
    
}
