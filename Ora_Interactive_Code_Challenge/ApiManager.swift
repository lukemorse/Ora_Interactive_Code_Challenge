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
    let URL_GET_CHATS = URL_BASE + "chats?page=1&limit=50"
    let URL_CHATS = URL_BASE + "chats"
    let URL_PATCH_CHAT = URL_BASE + "chats/{id}"
    let URL_NEW_MESSAGE = URL_BASE + "/chats/{id}/chat_messages{?page,limit}"
    
    func login(email: String, password: String, completion: @escaping () -> Void) {
        
        Alamofire.request(URL_LOGIN, method: .post).authenticate(user: email, password: password).responseJSON { response in
            
            if let JSON = response.response?.allHeaderFields {
                let jsonDict = JSON as! [String: String]
                self.authToken = jsonDict["Authorization"]
            }
            
            if let jsonVal = response.value {
                if let jsonDict = jsonVal as? [String: Any] {
                    print(jsonDict)
                    if let data = jsonDict["data"] as? [String:AnyObject] {
                        print(data)
                        
//                        self.userID = data["id"] as! Int?
                        let name = data["name"] as! String
                        let email = data["email"] as! String
                        
                        CURRENT_USER = User.init(id: 2, name: name, email: email)
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
        
        completion()
    }
    
    func registerNewUser(name: String, email: String, password: String) {
        
        let params = [
            "name" : name,
            "email" : email,
                      ]
        
        Alamofire.request(URL_CREATE_USER, method: .post, parameters: params, encoding: URLEncoding.default).responseString { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func viewCurrentUserProfile() {
        
        Alamofire.request(URL_CURRENT_PROFILE).responseString { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateCurrentUserProfile(name: String, email: String, password: String, confirm: String) {
        
        let params = [
            "name" : name,
            "email" : email,
            "password" : password,
            "confirm" : confirm
        ]
        
        Alamofire.request(URL_CURRENT_PROFILE, method: .patch, parameters: params, encoding: URLEncoding.default).responseString { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getListOfChats() {
        
        Alamofire.request(URL_GET_CHATS, encoding: URLEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                if let jsonVal = response.value {
                    if let jsonDict = jsonVal as? [String: Any] {
                        if let data = jsonDict["data"] as? [String:AnyObject?] {
                            //*****
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func createChat(name: String, message: String) {
        
        let params = [
            "name" : name,
            "message" : message
        ]
        
        Alamofire.request(URL_CHATS, method: .post, parameters: params, encoding: URLEncoding.default).responseString { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateChat(id: Int) {
        
        let updateChatURL = URL_CHATS + "/\(id)"
        
        Alamofire.request(updateChatURL, method: .patch, encoding: URLEncoding.default).responseString { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getChatMessages(id: Int) {
        
        let getChatMessagesUrl = URL_CHATS + "/\(id)/chat_messages?page=1&limit=50"
        
        Alamofire.request(getChatMessagesUrl, encoding: URLEncoding.default).responseString {
            response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func createChatMessage(id: Int, message: String) {
        
        let createChatURL = ""
        let params = ["message" : message]
        
        Alamofire.request(createChatURL, method: .post, parameters: params, encoding: URLEncoding.default).responseString { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
}
