//
//  User.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct User: Modaleble {
    
    var id: String
    var number: String
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var email: String?
    var image: String?
    
    func defaultModel() -> User {
        return User(id: "1", number: "77777777777", firstName: "Bob", middleName: "Boby", lastName: "Bobiev", email: nil, image: "")
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return (lhs.id == rhs.id) &&
            (lhs.number == rhs.number) &&
            (lhs.firstName == rhs.firstName) &&
            (lhs.middleName == rhs.middleName) &&
            (lhs.lastName == rhs.lastName) &&
            (lhs.email == rhs.email)
    }
}
