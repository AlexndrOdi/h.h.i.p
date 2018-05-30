//
//  AddChatViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol AddChatViewControllerIntputProtocol: class {
    func showContactsFromContactBook(contacts: [User])
    func showError(errorMessage: String)
}

protocol AddChatViewControllerOutputProtocol: class {
    func displayAllContacts()
}

class AddChatViewController: UIViewController, AddChatViewControllerIntputProtocol {
    
    //MARK: Properties
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts: [User] = []
    
    var presenter: AddChatViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        AddChatConfigurer.sharedInstance.configureAddChatView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showContactsFromContactBook(contacts: [User]) {
        self.contacts.append(contentsOf: contacts)
        
        DispatchQueue.main.async {
            self.contactsTableView.reloadData()
        }
    }
    
    func showError(errorMessage: String) {
        print("алерт с ошибкой")
    }
}
extension AddChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as! ContactCell
        
        switch indexPath.row {
        case 0:
            cell.label.text = "Добавить коллегу"
            cell.photoView.image = #imageLiteral(resourceName: "one_contact")
        case 1:
            cell.label.text = "Добавить группу коллег"
            cell.photoView.image = #imageLiteral(resourceName: "group_countacts")
        default:
            let contact = contacts[indexPath.row - 2]
            
            let label = contact.firstName ?? ""
            
            cell.label.text = contact.lastName ?? "" + label
            //TODO: доделать для аватарки контакта
//            cell.photoView.image = contact.image
        }
        return cell
    }
    
    
}
extension AddChatViewController: UITableViewDelegate {
    //TODO: дописать после роутинга на другой экран и т.д.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
