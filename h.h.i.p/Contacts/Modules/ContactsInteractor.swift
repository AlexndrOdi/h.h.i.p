//
//  ContactsInteractor.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
import Contacts

protocol ContactsInteractorInputProtocol: class {
    func fetchAllContacts()
}

protocol ContactsInteractorOutputProtocol: class {
//    providedContactsFromContactBook(contacts: contacts)
}

class ContactsInteractor: ContactsInteractorInputProtocol {
    
    weak var presenter: ContactsInteractorOutputProtocol!
    
    func fetchAllContacts() {
//        CNContactStore().requestAccess(for: .contacts, completionHandler: {(success, error) in
//            if success {
//                guard let contacts = self.DataManager.fetchAllContactsFromContactBook() else {
//                    fatalError("Ошибка при попытке получить список контактов")
//                }
//                self.presenter.providedContactsFromContactBook(contacts: contacts)
//            } else {
//                let error = Error(id: "1", errorCode: error.debugDescription, errorDescription: error?.localizedDescription ?? "", urlString: "")
//                self.presenter.serviceError(error: error)
//            }
//        })
    }

    
}
