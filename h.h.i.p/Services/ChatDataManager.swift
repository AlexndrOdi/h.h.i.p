//
//  ChatDataManager.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ChatsProtocol {
    //TODO: протокольное общение от дата манагера к интерактору
    func fetchAllChatsFromAPI() -> [Chat]

}

class ChatDataManager: ChatsProtocol {
    
    var chats: [Chat] = []
    let chat = Chat(id: "1", users: [User(id: "1",
                                          number: "some_number",
                                          firstName: "Bob",
                                          lastName: "Bobin",
                                          email: nil),
                                     User(id: "3", number: "other number",
                                          firstName: nil,
                                          lastName: "Jonson",
                                          email: "email")],
                    messeges: [Messege(id: "12", text: "Hello boy!", date: Date())])
    
    func fetchAllChatsFromAPI() -> [Chat] {

        while chats.count < 5 {
            chats.append(chat)
        }
        
        return chats
    }
    
    //TODO: сделать мемори кэш сервис
}
