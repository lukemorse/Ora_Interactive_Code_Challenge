//
//  User.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/23/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var email: String
    var password: String
    var confirm: String
    
    init(name: String, email: String, password: String, confirm: String) {
        self.name = name
        self.email = email
        self.password = password
        self.confirm = confirm
    }
}
