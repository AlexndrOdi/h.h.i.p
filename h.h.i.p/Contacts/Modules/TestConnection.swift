//
//  TestConnection.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 10.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation
import SocketIO

class SocketTest: NSObject {
    
    var manager = SocketManager(socketURL: URL(string: "htpp://195.133.144.75:80/")!, config: [.log(true)])
    var socket: SocketIOClient!
    
    var view: ContactsViewControllerInputProtocol!
    
    override init() {
        super.init()
        socket = manager.socket(forNamespace: "/test")
        
        socket.onAny { (event) in
            let status = self.socket.status.description
            let event = event.description
            self.view.updateFields(debug: status, event: event)
            
            print("это эни евент \(event.description)")
        }
        
    }
    
    
    func connectEstb() {

        socket.connect()
    }
    func onEstb() {
        
        print(socket.status)
        socket.on("hui") { (data, emitter) in
            print(data.description)
            print("--------")
            print(emitter.description)
        }
    }
    
    
        
}
