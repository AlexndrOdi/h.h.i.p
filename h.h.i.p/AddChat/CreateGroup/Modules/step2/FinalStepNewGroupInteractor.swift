//
//  FinalStepNewGroupInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol FinalStepNewGroupInteractorInputProtocol: class {
    func createNewGroup()
    func initSelectedContacts(_ contacts: [User])
}

protocol FinalStepNewGroupInteractorOutputProtocol: class {
    func providedContacts(_ contacts: [User])
}

class FinalStepNewGroupInteractor: FinalStepNewGroupInteractorInputProtocol {
    
    weak var presenter: FinalStepNewGroupPresenterInputProtocol!
    var DataManager: ChatsProtocol!
    
    var selectedContacts: [User] = []
    
    func initSelectedContacts(_ contacts: [User]) {
        self.selectedContacts = contacts
        presenter.providedContacts(contacts)
    }
    
    func createNewGroup() {
        print("save created group in data and send to BE")
    }
}
