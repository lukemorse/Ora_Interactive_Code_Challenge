
//
//  ChatViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/26/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit
import Alamofire

let URL_GET_CHATS = URL_BASE + "chats?page=1&limit=50"

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!

//    var chats = [String:AnyObject?]()
    var chats: [OraChat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)
        loadChats()
    }
    
    func loadChats() {
        
        Alamofire.request(URL_GET_CHATS, encoding: URLEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                if let jsonVal = response.value {
                    if let jsonDict = jsonVal as? [String : AnyObject?] {
                        print("JSON DICT")
                        if let data = jsonDict["data"] as? [[String : AnyObject?]] {
                            if let lastChat = data[0]["last_chat_message"] as? [String : AnyObject] {
                                print(lastChat)
                                var user: User?
                                if let userInfo = lastChat["user"] as? [String : AnyObject] {
                                    user = User.init(id: userInfo["id"] as! Int!,
                                                     name: userInfo["name"] as! String!,
                                                     email: userInfo["email"] as! String!)
                                }
                                let chat = OraChat.init(id: lastChat["id"] as! Int!,
                                                        chat_id: lastChat["chat_id"] as! Int!,
                                                        user_id: lastChat["user_id"] as! Int!,
                                                        message: lastChat["message"] as! String!,
                                                        created_at: lastChat["created_at"] as! String!,
                                                        user: user!)
                                self.chats.append(chat)
                            }
                        }
                        
                        
                        print("CHATS")
                        print(self.chats)
                        self.tableView.reloadData()
                        //                        if let data = jsonDict["data"] as? [String : AnyObject?]
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? ChatCell {
            let thisChat = chats[indexPath.row]
            cell.chatTitleLabel.text = "A chat by \(thisChat.user!.name)"
            cell.userAndTimeLabel.text = "\(thisChat.created_at!)"
            cell.lastMessageLabel.text = thisChat.message
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }

}
