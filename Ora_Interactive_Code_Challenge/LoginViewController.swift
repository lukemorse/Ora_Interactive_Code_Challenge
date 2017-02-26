//
//  LoginViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/21/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var registerButton: UIBarButtonItem!
    @IBOutlet var loginButton: UIBarButtonItem!
    
    let fields = ["Email", "Password"]
    var cells: [OraCell?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OraCell", for: indexPath) as? OraCell {
            cell.cellLabel.text = fields[indexPath.row]
            cells.append(cell)
            print(cells)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    @IBAction func loginButtonPressed(_ sender: UIBarButtonItem) {
        
        if let email = cells[0]?.cellTextField.text,
            let password = cells[1]?.cellTextField.text {
            ApiManager.sharedInstance.getAuthToken(email: email, password: password)
        } else {
            print("EMAIL AND/OR PASSWORD NOT ENTERED")
        }
    }
    

    

}
