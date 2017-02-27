//
//  AccountViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/26/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!
    
    let fields = ["Name","Email","Password","Confirm"]
    var cells: [OraCell?] = []
    let currentUserInfo = [CURRENT_USER?.name, CURRENT_USER?.email, "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)
        print(currentUserInfo)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AccountOraCell", for: indexPath) as? OraCell {
            cell.cellLabel.text = fields[indexPath.row]
            cells.append(cell)
            print(cells)
            cell.cellTextField.text = currentUserInfo[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        ApiManager.sharedInstance.viewCurrentUserProfile()
    }

}
