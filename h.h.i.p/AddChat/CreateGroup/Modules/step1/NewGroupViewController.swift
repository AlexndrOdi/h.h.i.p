//
//  NewGroupViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 06.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol NewGroupViewControllerInputProtocol: class {
    func displayContacts(_ contacts: [User])
}

protocol NewGroupViewControllerOutputProtocol: class {
    func saveContacts(_ contacts: [User])
    func passDataToNextStep(segue: UIStoryboardSegue)
    func navigateToNextStep()
}

class NewGroupViewController: UIViewController, UINavigationControllerDelegate, NewGroupViewControllerInputProtocol {

    @IBOutlet weak var createGroupTable: UITableView!
    
    var presenter: NewGroupViewControllerOutputProtocol!
    
    var contacts: [User] = []
    var selectedContacts: [User] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewGroupConfigurer.sharedInstance.configureNewGroupView(viewController: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        presenter.passDataToNextStep(segue: segue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navigationTitleNewGroup
        setup()
        // Do any additional setup after loading the view.
    }
    
    func displayContacts(_ contacts: [User]) {
        self.contacts = contacts
    }
    
    //Privete methods and setups
    private func setup() {
        let nextButton = UIBarButtonItem(title: "Дальше",
                                         style: .done,
                                         target: self,
                                         action: #selector(nextStep))
        self.navigationItem.rightBarButtonItem = nextButton
    }
    @objc private func nextStep() {
        presenter.navigateToNextStep()
    }
}

extension NewGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateGroupContactCell.identifier, for: indexPath) as? CreateGroupContactCell else {
            fatalError("The dequeued cell is not an instance of CreateGroupContactCell")
        }
        let first = contacts[indexPath.row].firstName ?? ""
        let last = contacts[indexPath.row].lastName ?? ""
        let middle = contacts[indexPath.row].middleName ?? ""
        
        cell.contactName.text = first + " " + middle + " " + last
        
        return cell
    }
}
extension NewGroupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CreateGroupContactCell else {
            fatalError("The dequeued cell is not an instance of CreateGroupContactCell")
        }
        cell.checkBoxTapped()
        
        if cell.checkBox.isSelected {
            selectedContacts.append(contacts[indexPath.row])
        } else {
            //TODO: сделать поиск по айдишнику вместо имени
            if let index = selectedContacts.index(of: selectedContacts.first(where: { $0.firstName! == contacts[indexPath.row].firstName! })!) {
                selectedContacts.remove(at: index)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
