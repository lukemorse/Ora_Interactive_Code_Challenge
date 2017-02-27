
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

    var chats = [String:AnyObject?]()
    
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
                        print(jsonDict)
                        self.chats = jsonDict
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
        return UITableViewCell()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}
