//
//  LabelContactBookCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 06.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class LabelContactBookCell: UITableViewCell {
    
    @IBOutlet weak var labelContackBook: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelContackBook.text = contactBook
        backgroundColor = UIColor.lightGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension LabelContactBookCell: ReuseIdentifierProtocol {
    
}
