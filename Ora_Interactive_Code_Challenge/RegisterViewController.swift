//
//  RegisterViewController.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/21/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var loginButton: UIBarButtonItem!
    @IBOutlet var registerButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 72)

    }

}
