//
//  ContactsPresenter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ContactsPresenterInputProtocol: ContactsViewControllerOutputProtocol, ContactsInteractorOutputProtocol {
    
}

protocol ContactsPresenterOutputProtocol {
    
}

class ContactsPresenter: ContactsPresenterInputProtocol {

    weak var view: ContactsViewControllerInputProtocol!
    var interactor: ContactsInteractorInputProtocol!
    var router: ContactsRouterInputProtocol!
    
    func fetchAllContacts() {
//        interactor
    }
    
    
}
