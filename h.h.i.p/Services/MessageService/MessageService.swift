//
//  MessageService.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 31.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
//TODO: понять необходимость этого сервиса
protocol MessageServiceInputProtocol: class {
    func createMessage(text: String, date: Date, user: User) -> Messege
    func updateMessage(message: Messege) -> Messege
    func deleteMessage(message: Messege) -> Bool
    func sendMessage(message: Messege) -> Bool
}

protocol MessageServiceOutputProtocol: class {
    
}

class MessageService: MessageServiceInputProtocol {
    
    func createMessage(text: String, date: Date, user: User) -> Messege {
        return Messege(id: "newID?",
                       text: text,
                       date: Date())
    }
    
    func updateMessage(message: Messege) -> Messege {
        return message
    }
    
    func deleteMessage(message: Messege) -> Bool {
        return false
    }
    
    func sendMessage(message: Messege) -> Bool {
        return false
    }

}
