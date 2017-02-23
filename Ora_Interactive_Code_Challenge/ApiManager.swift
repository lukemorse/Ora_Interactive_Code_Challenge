//
//  ApiManager.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/22/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager: NSObject {
    
    static let sharedInstance = ApiManager()
    
    let URL_BASE = "https://private-93240c-oracodechallenge.apiary-mock.com/"
    
    func getAuthToken() {
        
        Alamofire.request(URL_BASE + "auth/login", method: .post).responseJSON { response in
            
            if let JSON = response.response {
                print("JSON: \(JSON)")
            }
            
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
}
