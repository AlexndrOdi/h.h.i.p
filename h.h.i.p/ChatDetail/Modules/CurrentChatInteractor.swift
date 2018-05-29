//
//  CurrentChatInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol CurrentChatInteractorOutputProtocol: class {
    func providedCurrentChat(chat: Chat)
}

protocol CurrentChatInteractorInputProtocol: class {
    func initChat(chat: Chat)
}

class CurrentChatInteractor: CurrentChatInteractorInputProtocol {
    
    weak var presenter: CurrentChatInteractorOutputProtocol!
    var chat: Chat?
    
    func initChat(chat: Chat) {
        self.chat = chat
        presenter.providedCurrentChat(chat: chat)
    }
}
