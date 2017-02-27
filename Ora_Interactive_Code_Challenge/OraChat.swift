//
//  OraChat.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/27/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import Foundation

struct OraChat {

    var id: Int?
    var chat_id: Int?
    var user_id: Int?
    var message: String?
    var created_at: String?
    var user: User?
    
    init(id: Int,chat_id: Int, user_id: Int, message: String, created_at: String, user: User) {
        self.id = id
        self.chat_id = chat_id
        self.user_id = user_id
        self.message = message
        self.created_at = created_at
        self.user = user
    }
}
    
    
