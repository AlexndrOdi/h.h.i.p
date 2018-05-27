//
//  ChatCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 27.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var imageContactView: UIImageView!
    @IBOutlet weak var labelContactName: UILabel!
    @IBOutlet weak var textLastMessageField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageContactView.backgroundColor = UIColor.blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ChatCell: ReuseIdentifierProtocol {
    
}
