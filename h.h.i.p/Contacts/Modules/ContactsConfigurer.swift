//
//  ContactsConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class ContactsConfigurer {
    
    static let sharedInstance = ContactsConfigurer()
    
    func configureContactsView(viewController: ContactsViewController) {
        
        let socket = SocketTest()
        socket.view = viewController
        socket.connectEstb()
    }
    
}
