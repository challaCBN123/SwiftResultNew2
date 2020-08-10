//
//  DetailsViewController.swift
//  SwiftResultNew
//
//  Created by Bhargava on 07/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
protocol sendDataDelegate{
    func passData(name:String)
}
class DetailsViewController: UIViewController{
  
    var Delegate : sendDataDelegate!
    var id = String()
    var name = String()
    var userName = String()
    var email = String()
    var phone = String()
    var website = String()
    var companyName = String()
    var steet = String()
    var city = String()
    var zip = String()
    @IBOutlet weak var idLbl:UILabel!
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var userNameLbl:UILabel!
    @IBOutlet weak var emailLbl:UILabel!
    @IBOutlet weak var phoneLbl:UILabel!
    @IBOutlet weak var websiteLbl:UILabel!
    @IBOutlet weak var companyNameLbl:UILabel!
    @IBOutlet weak var streetLbl:UILabel!
    @IBOutlet weak var cityLbl:UILabel!
    @IBOutlet weak var zipCodeLbl:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLbl.text = "Id : --  " + id
        self.nameLbl.text = "Name : --  " + name
        self.userNameLbl.text = "UserName : --  " + userName
        self.emailLbl.text = "Email : --  " + email
        self.phoneLbl.text = "Phone : --  " + phone
        self.websiteLbl.text = "Website : --  " + website
        self.companyNameLbl.text = "CompanyName : --  " + companyName
        self.streetLbl.text = "StreetName : --  " + steet
        self.cityLbl.text = "City : --  " + city
        self.zipCodeLbl.text = "ZipCode : --  " + zip
        
        Delegate.passData(name: name)
    }
    

}
