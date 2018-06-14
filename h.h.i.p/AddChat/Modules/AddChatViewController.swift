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
    func navigateToChat()
    func passDataToNextScene(segue: UIStoryboardSegue)
}

class AddChatViewController: UIViewController, AddChatViewControllerIntputProtocol {
    
    //MARK: Properties
    @IBOutlet weak var contactsTableView: UITableView?
    
    var contacts: [User] = []
    
    var presenter: AddChatViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        AddChatConfigurer.sharedInstance.configureAddChatView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navigationTitleAddChat
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        presenter.passDataToNextScene(segue: segue)
    }
    
    func showContactsFromContactBook(contacts: [User]) {
        self.contacts.append(contentsOf: contacts)
        
        DispatchQueue.main.async {
            self.contactsTableView?.reloadData()
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
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footerView = UILabel(frame: CGRect(x: 70, y: 25, width: 100, height: 30))
            footerView.textAlignment = .center
            footerView.text = contactBook
            footerView.backgroundColor = footerColor
            return footerView
        }
        return UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return contacts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NewContactCell.identifier, for: indexPath) as? NewContactCell else {
                    fatalError("The dequeued cell is not an instance of NewContactCell.")
                }
                return cell
            }
            if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupContactCell.identifier, for: indexPath) as? GroupContactCell else {
                    fatalError("The dequeued cell is not an instance of GroupContactCell")
                }
                return cell
            }
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as? ContactCell else {
                fatalError("The dequeued cell is not an instance of ContactCell")
        }
        let contact = contacts[indexPath.row]
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
extension AddChatViewController: UITableViewDelegate {
    //TODO: дописать после роутинга на другой экран и т.д.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: presenter.navigateToNewContact()
            case 1: presenter.navigateToCreateGroup()
            default:
                fatalError("Undefined row on AddChatView")
            }
        } else {
            presenter.navigateToChat()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
