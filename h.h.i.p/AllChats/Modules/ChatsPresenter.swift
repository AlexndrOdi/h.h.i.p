//
//  ChatsPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol ChatsPresenterInputProtocol: ChatsViewControllerOutputProtocol, ChatsInteractorOutputProtocol {
    //TODO: протокольное общение от презентера к контроллеру
}

class ChatsPresenter: ChatsPresenterInputProtocol {
    
    weak var view: ChatsViewControllerInputProtocol!
    var interactor: ChatsInteractorInputProtocol!
    var router: ChatsRouterInput!
    
    func fetchAllChats() {
        view.showWaitingView()
        interactor.fetchAllChatsFromDataManager()
    }
    
    //Return chats and interactor passes all data
    func providedChats(chats: [Chat]) {
        view.hideWaitingView()
        self.view.displayFetchedChats(chats: chats)
    }
    //Service error
    func sirviceError (error: Error) {
        self.view.showError(errorMessage: error.errorDescription)
    }
    
    func navigateToChatDetail() {
        router.navigateToChatDetail()
    }
    
    //Pass data to next scene
    func passDataToNextScene(segue: UIStoryboardSegue) {
        self.router.passDataToNextScene(segue: segue)
    }
    
}
