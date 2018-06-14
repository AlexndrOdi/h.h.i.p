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
        
        var contacts: [User] = []
        let (result, auth) = DataManager.fetchAllContactsFromContactBook()
        
        if auth == .authorized {
            contacts = asUsers(contacts: result)
            self.presenter.providedContactsFromContactBook(contacts: contacts)
        }
        if auth == .denied {
            self.presenter.serviceError(error: Error(id: "1", errorCode: "2", errorDescription: "Contact book auth status = denied", urlString: ""))
        }
    }
    
    
    //Private methods
    private func asUsers(contacts: [CNContact]) -> [User] {
        var result: [User] = []
        for contact in contacts {
            guard let number = contact.phoneNumbers.first?.value.stringValue else {
                print("Cannot find number of contact:", contact.description)
                continue
            }
            guard let emailAddr = contact.emailAddresses.first?.value as String? else {
                print("Faild casting email to String:")
                continue
            }
            result.append(User(id: "",
                               number: number,
                               firstName: contact.givenName,
                               middleName: contact.middleName,
                               lastName: contact.familyName,
                               email: emailAddr,
                               image: "доделать надо"))
        }
        return result
    }
}
