//
//  RegisterViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/21/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var loginButton: UIBarButtonItem!
    @IBOutlet var registerButton: UIBarButtonItem!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIBarButtonItem) {
        
        if let name = nameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let confirm = confirmTextField.text {
            
            let user = User.init(name: name, email: email, password: password, confirm: confirm)
            
            ApiManager.sharedInstance.registerNewUser(user: user)
        }
    }
    
}
