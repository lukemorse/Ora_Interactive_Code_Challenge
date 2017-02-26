//
//  OraCell.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/25/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class OraCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cellTextField: UITextField!
    

}
