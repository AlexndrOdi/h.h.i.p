//
//  CreateGroupContactCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class CreateGroupContactCell: UITableViewCell {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var checkBox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func checkBoxTapped() {
        print("tapped check box")
        if checkBox.isSelected {
            checkBox.isSelected = false
        } else {
            checkBox.isSelected = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CreateGroupContactCell: ReuseIdentifierProtocol {
    
}
