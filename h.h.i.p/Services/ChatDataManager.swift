//
//  ChatDataManager.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
import Contacts

protocol ChatsProtocol {
    //TODO: протокольное общение от дата манагера к интерактору
    func fetchAllChatsFromAPI() -> [Chat]
    func fetchAllContactsFromContactBook() -> [User]?
    
}

class ChatDataManager: ChatsProtocol {
    
    var chats: [Chat] = []
    let chat = Chat(id: "1", users: [User(id: "1",
                                          number: "some_number",
                                          firstName: "Bob",
                                          lastName: "Bobin",
                                          email: nil),
                                     User(id: "3", number: "other number",
                                          firstName: nil,
                                          lastName: "Jonson",
                                          email: "email")],
                    messeges: [Messege(id: "12", text: "Hello boy!", date: Date())])
    
    func fetchAllChatsFromAPI() -> [Chat] {
        //TODO: прикрутить запрос апи и обработку ошибок+ответа
        while chats.count < 5 {
            chats.append(chat)
        }
        
        return chats
    }
    
    //Contacts from contact book
    func fetchAllContactsFromContactBook() -> [User]? {
        //TODO: реализовать метод подгрузки контактов из контакной книги
        var contactsResult: [User] = []
        do {
            let keys = [
                CNContactGivenNameKey,
                CNContactFamilyNameKey,
                CNContactPhoneNumbersKey,
                CNContactEmailAddressesKey
                ] as [CNKeyDescriptor]
            let request = CNContactFetchRequest(keysToFetch: keys)
            try CNContactStore().enumerateContacts(with: request, usingBlock: {(contact, stopingPointer) in
                let firstName = contact.givenName
                let lastName = contact.familyName
                guard let number = contact.phoneNumbers.first?.value.stringValue else {
                    print("пустой номер телефона у \(firstName)")
                    return
                }
                let email = contact.emailAddresses.first?.value as String?
                
                contactsResult.append(User(id: "111",
                                           number: number,
                                           firstName: firstName,
                                           lastName: lastName,
                                           email: email))
            })
                
            return contactsResult
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    //TODO: сделать мемори кэш сервис
}
