//
//  NewContactCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 06.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class NewContactCell: UITableViewCell {

    
    @IBOutlet weak var imageNew: UIImageView!
    @IBOutlet weak var labelNew: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelNew.text = addContact
        imageNew.image = #imageLiteral(resourceName: "one_contact")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension NewContactCell: ReuseIdentifierProtocol {
    
}
