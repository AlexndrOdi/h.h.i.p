//
//  AddChatRouter.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 29.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol AddChatRouterInputProtocol: class {
    func navigateToNewContact()
    func navigateToCreateGroup()
    func navigateToChat()
    func passDataToNextScene(segue: UIStoryboardSegue)
}

class AddChatRouter: AddChatRouterInputProtocol {
    
    weak var view: AddChatViewController!
    
    func navigateToNewContact() {
        view.performSegue(withIdentifier: "NewContact", sender: nil)
    }
    
    func navigateToCreateGroup() {
        view.performSegue(withIdentifier: "NewGroup", sender: nil)
    }
    
    func navigateToChat() {
        view.performSegue(withIdentifier: "ShowChat", sender: nil)
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
       
        switch segue.identifier ?? "" {
        case "NewGroup":
            guard let newGroupViewController = segue.destination as? NewGroupViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            print("pass data to new group")
            let contacts = self.view.contacts
            
            newGroupViewController.presenter.saveContacts(contacts)
        case "ShowChat":
            guard let currentChatViewController = segue.destination as? CurrentChatViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedIndexPath = view.contactsTableView?.indexPathForSelectedRow else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let contact = view.contacts[selectedIndexPath.row]
            
            currentChatViewController.presenter.saveSelectedChatByContact(contact)
            print("pass data to show chat")
        case "NewContact":
            return
        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))")
        }
    }
}
