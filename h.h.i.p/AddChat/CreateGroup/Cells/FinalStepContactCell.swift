//
//  FinalStepContactCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class FinalStepContactCell: UITableViewCell {

    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FinalStepContactCell: ReuseIdentifierProtocol {
    
}
