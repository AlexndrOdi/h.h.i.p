//
//  ChatRouter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol ChatsRouterInput: class {
    func navigateToChatDetail()
    func passDataToNextScene(segue: UIStoryboardSegue)
}

class ChatsRouter: ChatsRouterInput {
    
    //TODO: роутинг навигации и т.д.
    weak var chatsViewController: ChatsViewController!
    
    func navigateToChatDetail() {
        chatsViewController.performSegue(withIdentifier: "ShowChat", sender: nil)
    }
    
    //Navigate to next module
    func passDataToNextScene(segue: UIStoryboardSegue) {
        switch segue.identifier ?? "" {
        case "ShowChat":
            guard let currentChatViewController = segue.destination as? CurrentChatViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            //TODO: необходимость?
//            guard let selectedChat = sender as? ChatCell else {
//                fatalError("Unexpected sender: \(String(describing: sender))")
//            }
            guard let selectedIndexPath = chatsViewController.tableChatsView.indexPathForSelectedRow else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let chat = chatsViewController.chats[selectedIndexPath.row]
            
            //TODO: доделать передачу чата в другой модуль
            currentChatViewController.presenter.saveSelectedChat(chat: chat)
//        case :
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
}
