//
//  Chat.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

struct Chat: Modaleble {

    var id: String
    var users: [User]
    var messeges: [Messege]
    
    func defaultChat() -> Chat {
        return Chat(id: "1", users: [User(id: "0",
                                          number: "phone number",
                                          firstName: "Bob",
                                          lastName: "Bobiev",
                                          email: "some_email"),
                                     User(id: "2",
                                          number: "other number",
                                          firstName: "Jon",
                                          lastName: "Jonson",
                                          email: nil)], messeges: [Messege(id: "2",
                                                                                    text: "Hay!",
                                                                                    date: Date())])
    }
    
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return (lhs.id == rhs.id) &&
        (lhs.users == rhs.users) &&
        (lhs.messeges == rhs.messeges)
    }
    
}
