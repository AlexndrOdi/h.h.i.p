//
//  ChatsPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ChatsPresenterInputProtocol: ChatsViewControllerOutputProtocol {
    //TODO: протокольное общение от презентера к контроллеру
}

class ChatsPresenter: ChatsPresenterInputProtocol {
    
    var interactor: ChatsInteractorInputProtocol!
    
    func fetchAllChats() {
        interactor.fetchAllChatsFromDataManager()
    }
}
