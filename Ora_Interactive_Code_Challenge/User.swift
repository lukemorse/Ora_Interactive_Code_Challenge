//
//  User.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/23/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import Foundation

struct User {
    var id: Int
    var name: String
    var email: String
    
    init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
