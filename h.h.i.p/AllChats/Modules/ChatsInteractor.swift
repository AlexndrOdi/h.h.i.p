//
//  ChatsInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ChatsInteractorInputProtocol {
    //TODO: протокольное общение от интерактора к презентеру
    func fetchAllChatsFromDataManager()
}

class ChatsInteractor: ChatsInteractorInputProtocol {
    
    var DataManager: ChatsProtocol!
    
    func fetchAllChatsFromDataManager() {
        var chats = DataManager.fetchAllChatsFromAPI()
    }
    
    //TODO: логика по обработке чатов какая-то
}
