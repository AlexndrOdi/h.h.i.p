//
//  Profile.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 08.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct Profile: Modaleble {
    var id: String
    var firstName: String?
    var lastName: String?
    var number: String
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        return (lhs.id == rhs.id) &&
            (lhs.firstName == rhs.firstName) &&
            (lhs.lastName == rhs.lastName) &&
            (lhs.number == rhs.number)
    }
}
