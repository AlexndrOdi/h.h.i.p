//
//  FinalGroupCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class FinalGroupCell: UITableViewCell {

    
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var groupPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        groupName.placeholder = "Имя группы"
        groupPhoto.image = #imageLiteral(resourceName: "empty_contact")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FinalGroupCell: ReuseIdentifierProtocol {
    
}
