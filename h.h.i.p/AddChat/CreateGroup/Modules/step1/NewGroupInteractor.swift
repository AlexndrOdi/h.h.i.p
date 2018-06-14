//
//  NewGroupInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol NewGroupInteractorInputProtocol: class {
    func initContacts(_ contacts: [User])
}

protocol NewGroupInteractorOutputProtocol: class {
    func providedContacts(_ contacts: [User])
}

class NewGroupInteractor: NewGroupInteractorInputProtocol {
 
    weak var presenter: NewGroupPresenterInputProtocol!
    
    var contacts: [User] = []
    
    func initContacts(_ contacts: [User]) {
        self.contacts = contacts
        presenter.providedContacts(contacts)
    }
}
