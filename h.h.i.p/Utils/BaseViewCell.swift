//
//  BaseViewCell.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 31.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class BaseViewCell: UICollectionViewCell {
    //TODO: необходимость в рамках рефакторинга
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupeViews() {
        backgroundColor = UIColor.blue
    }
}
