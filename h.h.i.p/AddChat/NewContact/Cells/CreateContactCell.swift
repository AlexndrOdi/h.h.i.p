//
//  CreateContactCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 06.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class CreateContactCell: UITableViewCell {

    @IBOutlet weak var inputField: UITextField!
    
    var contact: User?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        inputField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CreateContactCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

extension CreateContactCell: ReuseIdentifierProtocol {
    
}
