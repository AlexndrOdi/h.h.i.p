//
//  AddChatPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 29.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol AddChatPresenterInputProtocol: AddChatViewControllerOutputProtocol, AddChatInteractorOutputProtocol {
    
}

class AddChatPresenter: AddChatPresenterInputProtocol {

    weak var view: AddChatViewControllerIntputProtocol!
    var interactor: AddChatInteractorInputProtocol!
    var router: AddChatRouterInputProtocol!
 
    func displayAllContacts() {
        interactor.fetchAllContacts()
    }
    
    func providedContactsFromContactBook(contacts: [User]) {
        view.showContactsFromContactBook(contacts: contacts)
    }
    
    func serviceError(error: Error) {
        view.showError(errorMessage: error.errorDescription)
    }
    
    //MARK: Navigation
    func navigateToNewContact() {
        router.navigateToNewContact()
    }
    
    func navigateToCreateGroup() {
        router.navigateToCreateGroup()
    }
    

    
}
