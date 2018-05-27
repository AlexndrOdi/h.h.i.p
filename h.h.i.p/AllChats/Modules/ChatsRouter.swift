//
//  ChatRouter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

protocol ChatsRouterInput: class {
    func navigateToChatDetail()
}

class ChatsRouter: ChatsRouterInput {
    //TODO: роутинг навигации и т.д.
    weak var chatsViewController: ChatsViewController!
    
    func navigateToChatDetail() {
        chatsViewController.performSegue(withIdentifier: "ShowChat", sender: nil)
    }
}
