//
//  MessageViewCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class MessageViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var textBubbleView: UIView!
    @IBOutlet weak var message: UITextView!
    
    override func awakeFromNib() {
        message.font = UIFont.systemFont(ofSize: 18)
        message.backgroundColor = UIColor.clear
        
        textBubbleView.layer.cornerRadius = 15
        textBubbleView.layer.masksToBounds = true
        
        photo.layer.cornerRadius = 15
        photo.layer.masksToBounds = true
    }
    //TODO: наверное стоит сделать отдельный базовый клас для всех селл класов (BaseCell)

//    var message: UITextView = {
//       let textView = UITextView()
//        textView.font = UIFont.systemFont(ofSize: 18.0)
//        textView.backgroundColor = UIColor.clear
//        textView.textColor = UIColor.black
//        return textView
//    }()
//
//    var textBubbleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
//        view.layer.cornerRadius = 15
//        view.layer.masksToBounds = true
//        return view
//    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        addSubview(textBubbleView)
//        addSubview(message)
//    }
}
extension MessageViewCell: ReuseIdentifierProtocol {
    
}
