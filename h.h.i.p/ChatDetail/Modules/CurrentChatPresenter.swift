//
//  CurrentChatPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol CurrentChatPresenterInputProtocol: CurrentChatInteractorOutputProtocol, CurrentChatViewControllerOutputProtocol {
}

class CurrentChatPresenter: CurrentChatPresenterInputProtocol {
    
    weak var view: CurrentChatViewControllerInputProtocol!
    var interactor: CurrentChatInteractorInputProtocol!
    var router: CurrentChatRouterInputProtocol!
    
    //Pass data from module chats
    func saveSelectedChat(chat: Chat) {
        self.interactor.initChat(chat: chat)
    }
    
    func providedCurrentChat(chat: Chat) {
        self.view.displayCurrentChat(chat: chat)
    }
    
}
