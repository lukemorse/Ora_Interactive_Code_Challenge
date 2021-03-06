//
//  ChatCell.swift
//  Ora_Interactive_Code_Challenge
//
//  Created by Luke Morse on 2/27/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet var chatTitleLabel: UILabel!
    @IBOutlet var userAndTimeLabel: UILabel!
    @IBOutlet var lastMessageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
