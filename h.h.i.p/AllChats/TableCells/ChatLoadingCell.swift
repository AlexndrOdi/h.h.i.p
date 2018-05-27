//
//  ChatLoadingCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 27.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class ChatLoadingCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ChatLoadingCell: ReuseIdentifierProtocol {
    
}
