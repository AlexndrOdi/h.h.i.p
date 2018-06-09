//
//  SocketService.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 02.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit
import SocketIO

protocol SocketServiceInputProtocol: class {
    func send(message: Messege, from nickname: String)
}

protocol SocketServiceOutputProtocol: class {
    
}

class SocketService: NSObject, SocketServiceInputProtocol {

    //Singletone
    static let instance = SocketService()
    
    //TODO: донастроить конфигурацию сокета
    //MARK: Configuration
    let socketURL = URL(string: baseSocketUrl)!
    let socketConfiguration: SocketIOClientConfiguration = [.log(true),
                                                            .connectParams(["token" : ""]),
                                                            .secure(false),
                                                            .reconnectWait(15),
                                                            .reconnects(true),
                                                            .reconnectAttempts(2)]
    var manager: SocketManager!
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        self.manager = SocketManager(socketURL: socketURL, config: socketConfiguration)
//        self.socket = SocketIOClient(manager: manager, nsp: "/testSocket")
        self.socket = manager.defaultSocket
    }
    
    func establishConnection() {
        manager.connectSocket(socket)
    }
    
    func closeConnecion() {
        manager.disconnectSocket(socket)
    }
    //TODO: сделать все действия сокета через менеджера (все что ниже)
    //коннект к серверу и его прослушивание на событие event
    func connectToServerWith(nickname: String, completionHandler: @escaping (_ userProperty: [String?]) -> Void) {
        socket.emit("testUser", with: [nickname] )
        
        socket.on("event") { (data, emmiter) in //event - прослушиваемое событие, emmiter - ответ
            print(data.description)
            print(emmiter.description)
            
            completionHandler(data as! [String])
            print(data.description)
        }
    }
    //выход из чата
    func exitChatWith(nickname: String, completionHandler: () -> Void) {
        socket.emit("exitTestUser", with: [nickname])
        completionHandler()
        print("exit user " + nickname.description)
    }
    
    //TODO: сделать колбек для цепочки в обратную сторону
    //отправка сообщения на сервер
    func send(message: Messege, from nickname: String) {
        socket.emit("chatMessage", nickname, message.text)
        print(nickname.description + "|" + message.description)
    }

    func getAll(completionHandler: @escaping (_ messageInfo: [String]) -> Void) {
        print("get message from be")
        manager.socket(forNamespace: socket.nsp).onAny { (data) in
            var dic = data.items
            print(dic)
            print(dic?.first.debugDescription)
            completionHandler(["ku"])
        }
        
        
        
//        socket.on("newMessage") { (data, emmiter) in
//            var messageDictionary = [String: Any]()
//            messageDictionary["nickname"] = data[0]
//            messageDictionary["date"] = data[1]
//            messageDictionary["message"] = data[2]
//
//            completionHandler(messageDictionary)
//            print(messageDictionary.description)
//        }
    }
    
    //получить новое сообщений с сервера
    func getMessage(completionHandler: @escaping (_ messageInfo: [String: Any]) -> Void) {
        print("get message from be")
        socket.on("newMessage") { (data, emmiter) in
            var messageDictionary = [String: Any]()
            messageDictionary["nickname"] = data[0]
            messageDictionary["date"] = data[1]
            messageDictionary["message"] = data[2]
            
            completionHandler(messageDictionary)
            print(messageDictionary.description)
        }
    }
    //TODO: features
    //юзер пишет сообщение
    func startTypingMessage(nickname: String) {
        socket.emit("typing", nickname)
        print("user typing message")
    }
    
    //юзер прекратил писать сообщение
    func stopTypingMessage(nickname: String) {
        socket.emit("stopTyping", nickname)
        print("user stop typing message")
    }
}
