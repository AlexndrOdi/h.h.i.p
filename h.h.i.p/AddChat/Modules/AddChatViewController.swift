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
    func navigateToNewContact()
    func navigateToCreateGroup()
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
        let alert = UIAlertController(title: permissionDenied_CB, message: messagePermisionDenied_CB, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.navigationController?.present(alert, animated: true, completion: nil)
        print("алерт с ошибкой")
    }
}
extension AddChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = contactsTableView.dequeueReusableCell(withIdentifier: NewContactCell.identifier, for: indexPath) as! NewContactCell
            return cell
        case 1:
            let cell = contactsTableView.dequeueReusableCell(withIdentifier: GroupContactCell.identifier, for: indexPath) as! GroupContactCell
            return cell
        case 2:
            let cell = contactsTableView.dequeueReusableCell(withIdentifier: LabelContactBookCell.identifier, for: indexPath) as! LabelContactBookCell
            return cell
        default:
            let cell = contactsTableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as! ContactCell
            let contact = contacts[indexPath.row - 3]
            var fullName: String? = ""
            
            if let first = contact.firstName {
                fullName?.append(first + " ")
            }
            if let middle = contact.middleName {
                fullName?.append(middle + " ")
            }
            if let last = contact.lastName {
                fullName?.append(last)
            }
            cell.label.text = fullName
    
            //TODO: доделать для аватарки контакта
            cell.photoView.image = #imageLiteral(resourceName: "empty_contact")
            
            return cell
        }
    }
    
    
}
extension AddChatViewController: UITableViewDelegate {
    //TODO: дописать после роутинга на другой экран и т.д.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            print("default")
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
