//
//  Settings.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 08.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct Setting: Modaleble {
    
    var name: String
    var image: String
    
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        return (lhs.name == rhs.name) &&
                (lhs.image == rhs.image)
    }
}
