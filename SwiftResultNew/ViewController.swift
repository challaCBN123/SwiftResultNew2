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
    var actView: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var titleLabel: UILabel = UILabel()
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
         DispatchQueue.main.async {self.showActivity(myView: self.view, myTitle: "Loading.....")}
        //let header:HTTPHeaders = ["Content-Type":"application/json","User-Key":apiKey]
                GetData.services.gettingDataUsingUrl(baseUrl: baseUrl, serviceUrl: endKey, parameter: ([String:String].self as? NSDictionary), encoding: PARAMETER_ENCODING.JSON_ENCODING) { (dataResponse) in
                
                    switch dataResponse{
                               case .success(let details):
                                 
//                                   details.forEach { (dataUrl) in
//                                    //print(dataUrl.address?.city ?? "")
//                                   // self.usersData.append(dataUrl)
//
//                                   }
                                self.arraySerach = details
                            
                                   self.tblView.reloadData()
                              self.removeActivity(myView: self.view)
                                   break
                               case .failure(_):
                               
                                 self.removeActivity(myView: self.view)
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
        cell.serialNoLbl.text = "\(indexPath.row + 1)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func showActivity(myView: UIView, myTitle: String) {
        let THEME_COLOUR = UIColor (red:0.25, green:0.65, blue:0.333, alpha:0.5)
        myView.isUserInteractionEnabled = false
        myView.window?.isUserInteractionEnabled = false
        myView.endEditing(true)
        actView.frame = CGRect(x: 0, y: 0, width: myView.frame.width, height: myView.frame.height)
        actView.center = myView.center
        actView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = myView.center
        //loadingView.backgroundColor = THEME_COLOUR
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15

        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);

        titleLabel.frame = CGRect(x: 5, y: loadingView.frame.height-20, width: loadingView.frame.width-10, height: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = myTitle
        //titleLabel.font = .BoldAppFontOfSize(10)

        loadingView.addSubview(activityIndicator)
        actView.addSubview(loadingView)
        loadingView.addSubview(titleLabel)
        myView.addSubview(actView)
        activityIndicator.startAnimating()
    }
    func removeActivity(myView: UIView) {
        myView.isUserInteractionEnabled = true
        myView.window?.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        actView.removeFromSuperview()
    }
}

