//
//  MessageTableViewCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 28.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class MessageTableCell: UITableViewCell {

    @IBOutlet weak var message: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MessageTableCell: ReuseIdentifierProtocol {
    
}
