//
//  ChatsPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ChatsPresenterInputProtocol: ChatsViewControllerOutputProtocol, ChatsInteractorOutputProtocol {
    //TODO: протокольное общение от презентера к контроллеру
}

class ChatsPresenter: ChatsPresenterInputProtocol {
    
    weak var view: ChatsViewControllerInputProtocol!
    var interactor: ChatsInteractorInputProtocol!
    
    func fetchAllChats() {
        interactor.fetchAllChatsFromDataManager()
    }
    
    //Return chats and interactor passes all data
    func providedChats(chats: [Chat]) {
        self.view.displayFetchedChats(chats: chats)
    }
    //Service error
    func sirviceError (error: Error) {
        self.view.showError(errorMessage: error.errorDescription)
    }
}
