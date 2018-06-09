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
    func fetchAllSettingsFromCash() -> [Setting]
    func fetchProfileInfoFromCash() -> Profile
    
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
    
    //Contacts from contact book
    func fetchAllContactsFromContactBook() -> [User]? {
        //TODO: реализовать метод подгрузки контактов из контакной книги
        var contactsResult: [User] = []
        do {
            let keys = [
                CNContactGivenNameKey,
                CNContactMiddleNameKey,
                CNContactFamilyNameKey,
                CNContactPhoneNumbersKey,
                CNContactEmailAddressesKey
                ] as [CNKeyDescriptor]
            let request = CNContactFetchRequest(keysToFetch: keys)
            try CNContactStore().enumerateContacts(with: request, usingBlock: {(contact, stopingPointer) in
                let firstName = contact.givenName
                let lastName = contact.familyName
                let middleName = contact.middleName
                guard let number = contact.phoneNumbers.first?.value.stringValue else {
                    print("пустой номер телефона у \(firstName)")
                    return
                }
                let email = contact.emailAddresses.first?.value as String?
                
                contactsResult.append(User(id: "111",
                                           number: number,
                                           firstName: firstName,
                                           middleName: middleName,
                                           lastName: lastName,
                                           email: email,
                                           image: ""))
            })
                
            return contactsResult
        } catch {
            print(error.localizedDescription)
            return nil
        }
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
}
