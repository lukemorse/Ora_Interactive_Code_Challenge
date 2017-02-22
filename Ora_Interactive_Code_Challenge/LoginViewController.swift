//
//  LoginViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/21/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var registerButton: UIBarButtonItem!
    @IBOutlet var loginButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
