//
//  LoginViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/21/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextViewDelegate {
    

    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var registerButton: UIBarButtonItem!
    @IBOutlet var loginButton: UIBarButtonItem!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIBarButtonItem) {
        
        if let email = emailTextField.text,
            let password = passwordTextField.text {
            ApiManager.sharedInstance.getAuthToken(email: email, password: password)
        } else {
            print("EMAIL AND/OR PASSWORD NOT ENTERED")
        }
        
        
    }
    

}
