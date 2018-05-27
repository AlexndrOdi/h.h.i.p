//
//  ChatsInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ChatsInteractorInputProtocol: class {
    //TODO: протокольное общение от интерактора к презентеру
    func fetchAllChatsFromDataManager()
}
protocol ChatsInteractorOutputProtocol: class {
    func providedChats(chats: [Chat])
    func sirviceError (error: Error)
}

class ChatsInteractor: ChatsInteractorInputProtocol {
    
    weak var presenter: ChatsInteractorOutputProtocol!
    var DataManager: ChatsProtocol!
    
    func fetchAllChatsFromDataManager() {
        let chats = DataManager.fetchAllChatsFromAPI()
        self.presenter.providedChats(chats: chats)
    }
    
    //TODO: логика по обработке чатов какая-то
}
