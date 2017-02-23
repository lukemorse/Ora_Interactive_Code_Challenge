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
    
    var userEmail: String?
    var userID: Int?
    var userName: String?
    var authToken: String?
    
    let URL_LOGIN = URL_BASE + "auth/login"
    let URL_LOGOUT = URL_BASE + "auth/logout"
    let URL_CREATE_USER = URL_BASE + "users"
    let URL_CURRENT_PROFILE = URL_BASE + "users/current"
    let URL_GET_CHATS = URL_BASE + "chats{?page,limit}"
    let URL_NEW_CHAT = URL_BASE + "chats"
    let URL_PATCH_CHAT = URL_BASE + "chats/{id}"
    let URL_VIEW_WHOLE_CHAT = URL_BASE + "/chats/{id}/chat_messages"
    let URL_NEW_MESSAGE = URL_BASE + "/chats/{id}/chat_messages{?page,limit}"
    
    func getAuthToken() {
        
        Alamofire.request(URL_LOGIN, method: .post).responseJSON { response in
            
//            print("RESPONSE:"); print(response.response)
//            print("DATA: "); print(response.data)
//            print("RESULT: "); print(response.result)
//            print("VALUE: "); print(response.value)
            
            if let JSON = response.response?.allHeaderFields {
                let jsonDict = JSON as! [String: String]
                self.authToken = jsonDict["Authorization"]
            }
            
            if let jsonVal = response.value {
                if let jsonDict = jsonVal as? [String: Any] {
                    print(jsonDict)
                    if let data = jsonDict["data"] as? [String:AnyObject] {
                        print(data)
                        
                        self.userID = data["id"] as! Int?
                        self.userEmail = data["email"] as! String?
                        self.userName = data["name"] as! String?
                    }
                }
            }
            
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func registerNewUser(user: User) {
        
        let params = [
            "name" : user.name,
            "email" : user.email,
            "password" : user.password,
            "confirm" : user.confirm
                      ]
        
        Alamofire.request(URL_BASE + "auth/login", method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { response in
            
            print(response)
            
        }
    }
    
    
    
}
