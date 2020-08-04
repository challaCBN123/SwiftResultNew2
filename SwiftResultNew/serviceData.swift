//
//  serviceData.swift
//  swiftResultType
//
//  Created by Bhargava on 02/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import Alamofire
class GetData:NSObject{
    static let services = GetData()
    let headers : HTTPHeaders = ["Content-Type":"application/json"]
    func gettingDataUsingUrl(baseUrl:String,serviceUrl:String,parameter:NSDictionary?,encoding:String,CompletionHandler: @escaping(Result<[DataUrl],Error>)->Void){
 
        AF.request(baseUrl,method: .get,parameters: (parameter as? Parameters),encoding: JSONEncoding.default).responseJSON { (dataResponse) in
            
        switch dataResponse.result{
            
        case .success(_):
            //guard let data = dataResponse.data else { return }
             guard let data = dataResponse.data else {return}
                do{
                    let jsonData = try JSONDecoder().decode([DataUrl].self, from: data)
                    //CompletionHandler(jsonData, nil)
                    CompletionHandler(.success(jsonData))
                    }catch{
                          print("server error")
                     }
            break
        case .failure(_):
            //CompletionHandler(nil, dataResponse.error?.localizedDescription as? Error)
            print("data error")
            break
        }
        
    }
        }
}
