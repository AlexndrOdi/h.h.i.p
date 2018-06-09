//
//  GroupContactCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 06.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class GroupContactCell: UITableViewCell {

    
    @IBOutlet weak var imageGroup: UIImageView!
    
    @IBOutlet weak var labelGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        labelGroup.text = addGroup
        imageGroup.image = #imageLiteral(resourceName: "group_countacts")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension GroupContactCell: ReuseIdentifierProtocol {
    
}
