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
    func fetchAllContactsFromContactBook() -> ([CNContact], CNAuthorizationStatus)
    func fetchAllSettingsFromCash() -> [Setting]
    func fetchProfileInfoFromCash() -> Profile
    func fetchChatByContactFromCash(_ contact: User) -> Chat
    func saveContactInContactBook(_ contact: User) -> CNAuthorizationStatus
    
}

class ChatDataManager: ChatsProtocol {

    var chats: [Chat] = []
    let chat = Chat(id: "1", users: [User(id: "1",
                                          number: "some_number",
                                          firstName: "Bob",
                                          middleName: "Biby",
                                          lastName: "Bobin",
                                          email: nil,
                                          image: "3"),
                                     User(id: "3",
                                          number: "other number",
                                          firstName: nil,
                                          middleName: "",
                                          lastName: "Jonson",
                                          email: "email",
                                          image: "4")],
                    messeges: [Messege(id: "12", text: "Hello boy!", date: Date())])
    
    func fetchAllChatsFromAPI() -> [Chat] {
        //TODO: прикрутить запрос апи и обработку ошибок+ответа и перенести на нетворкера
        while chats.count < 5 {
            chats.append(chat)
        }
        
        return chats
    }
    
    //Contact book
    func fetchAllContactsFromContactBook() -> ([CNContact], CNAuthorizationStatus) {
        //TODO: реализовать метод подгрузки контактов из контакной книги
        
        var contacts: [CNContact] = []
        var auth = CNContactStore.authorizationStatus(for: .contacts)
        
        if auth == .denied {
            return ([], auth)
        }
        if auth == .notDetermined {
            CNContactStore().requestAccess(for: .contacts) { (success, error) in
                if success {
                    contacts = self.fetchContactsFromCB()
                } else {
                    auth = CNContactStore.authorizationStatus(for: .contacts)
                }
            }
            return (contacts, auth)
        }
        if auth == .authorized {
            return (fetchContactsFromCB(), auth)
        }
        print("Auth status of contact book: \(auth)")
        return (contacts, auth)
    }
    func saveContactInContactBook(_ contact: User) -> CNAuthorizationStatus {
        var auth = CNContactStore.authorizationStatus(for: .contacts)
        
        if auth == .denied {
            return auth
        }
        
        if auth == .notDetermined {
            CNContactStore().requestAccess(for: .contacts) { (success, error) in
                if !success {
                    auth = CNContactStore.authorizationStatus(for: .contacts)
                }
            }
            
            return auth
        }
        
        if auth == .authorized {
            saveContact(contact)
        }
        
        return auth
    }
    
    //Settings from cash
    func fetchAllSettingsFromCash() -> [Setting]{
        //TODO: пока заглушка
        return [Setting(name: "Чат", image: "ChatSetting"),
                Setting(name: "Избранные сообщения", image: "FavoriteSetting"),
                Setting(name: "Уведомления", image: "NotificationSetting"),
                Setting(name: "Данные и хранилище", image: "DataBaseSetting"),
                Setting(name: "Помощь", image: "HelpSetting")]
    }
    func fetchProfileInfoFromCash() -> Profile {
        return Profile(id: "",
                       firstName: "Мое имя",
                       lastName: "моя фамилия",
                       number: "+7 777 777 77 77")
    }
    
    //TODO: сделать мемори кэш сервис
    
    //MARK: private func-s
    private func fetchContactsFromCB() -> [CNContact] {
        var contactsResult: [CNContact] = []
        
        do {
            let keys = [CNContactGivenNameKey,
                        CNContactMiddleNameKey,
                        CNContactFamilyNameKey,
                        CNContactPhoneNumbersKey,
                        CNContactEmailAddressesKey,
                        CNContactImageDataKey] as [CNKeyDescriptor]
            let request = CNContactFetchRequest(keysToFetch: keys)
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopingPointer) in
                contactsResult.append(contact)
            })
            return contactsResult
        } catch (let err){
            print(err.localizedDescription)
            return []
        }
    }
    private func saveContact(_ contact: User) {
        
        let contactCN = CNMutableContact()
        
        if let firstName = contact.firstName {
            contactCN.givenName = firstName
        }
        if let middleName = contact.middleName {
            contactCN.middleName = middleName
        }
        if let lastName = contact.lastName {
            contactCN.familyName = lastName
        }
        //TODO: сделать для емейла
//        if let email = contact.email {
//            let mail = CNLabeledValue(label: CNLabelEmailiCloud, value:  )
//            contactCN.emailAddresses.append(mail)
//        }
        let phoneNumber = contact.number
        let number = CNLabeledValue(label: CNLabelPhoneNumberMain, value: CNPhoneNumber(stringValue: phoneNumber))
            contactCN.phoneNumbers = [number]
        
        //TODO: доделать для аватарок
//        if let image = contact.image
        
        let request = CNSaveRequest()
        request.add(contactCN, toContainerWithIdentifier: nil)
        
        do {
            try CNContactStore().execute(request)
        } catch let err{
            print("Catched some error fron save contact in contact book. ", err)
        }
    }
    //Find chat by contact from cash
    func fetchChatByContactFromCash(_ contact: User) -> Chat {

        for chat in self.chats {
            if chat.users.first(where: { $0 == contact }) != nil {
                return chat
            } else {
                break
            }
        }
        //TODO: продумать логику для нового чата
        return Chat(id: "1111",
                    users: [contact], messeges: [Messege(id: "144",
                                                         text: "new chat",
                                                         date: Date())])
    }
}
