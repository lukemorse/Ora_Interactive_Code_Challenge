//
//  RegisterViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/21/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var loginButton: UIBarButtonItem!
    @IBOutlet var registerButton: UIBarButtonItem!
    
    let fields = ["Name","Email","Password","Confirm"]
    var cells: [OraCell?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RegOraCell", for: indexPath) as? OraCell {
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
    
    @IBAction func registerButtonPressed(_ sender: UIBarButtonItem) {
        
        if let name = cells[0]?.cellTextField.text,
            let email = cells[1]?.cellTextField.text,
            let password = cells[2]?.cellTextField.text,
            let confirm = cells[3]?.cellTextField.text {
            
            if password == confirm {
                ApiManager.sharedInstance.registerNewUser(name: name, email: email, password: password)
            } else {
                print("email and password do not match")
            }
            
        }
    }
    
}
