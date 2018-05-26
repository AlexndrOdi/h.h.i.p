//
//  Messege.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct Messege: Modaleble {
    
    var id: String
    var text: String
    var date: Date
    
    static func == (lhs: Messege, rhs: Messege) -> Bool {
        return (lhs.id == rhs.id) &&
            (lhs.text == rhs.text) &&
            (lhs.date == rhs.date)
    }
}
