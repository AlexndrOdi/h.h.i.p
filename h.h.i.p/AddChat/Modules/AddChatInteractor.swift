//
//  AddChatInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 29.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
import Contacts

protocol AddChatInteractorInputProtocol: class {
    func fetchAllContacts()
}

protocol AddChatInteractorOutputProtocol: class {
    func providedContactsFromContactBook(contacts: [User])
    func serviceError(error: Error)
}

class AddChatInteractor: AddChatInteractorInputProtocol {
    
    weak var presenter: AddChatInteractorOutputProtocol!
    var DataManager: ChatsProtocol!
    
    func fetchAllContacts() {

        CNContactStore().requestAccess(for: .contacts, completionHandler: {(success, error) in
            if success {
                guard let contacts = self.DataManager.fetchAllContactsFromContactBook() else {
                    fatalError("Ошибка при попытке получить список контактов")
                }
                self.presenter.providedContactsFromContactBook(contacts: contacts)

            } else {
                let error = Error(id: "1", errorCode: error.debugDescription, errorDescription: error?.localizedDescription ?? "", urlString: "")
                self.presenter.serviceError(error: error)
            }
        })
        
    }
    
}
