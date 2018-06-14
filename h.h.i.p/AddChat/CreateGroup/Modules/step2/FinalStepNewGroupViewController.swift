//
//  FinalStepNewGroupViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 12.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol FinalStepNewGroupViewControllerInputProtocol: class {
    func displayContacts(_ contacts: [User])
}

protocol FinalStepNewGroupViewControllerOutputProtocol: class {
    func createGroup()
    func passDataToNextScene(segue: UIStoryboardSegue)
    func saveSelectedContacts(_ contacts: [User])
}

class FinalStepNewGroupViewController: UIViewController, UINavigationControllerDelegate, FinalStepNewGroupViewControllerInputProtocol {

    var selectedContacts: [User] = []
    
    var presenter: FinalStepNewGroupViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FinalStepNewGroupConfigurer.sharedInstance.configureFinalStepNewGroupView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navigationTitleNewGroup
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        presenter.passDataToNextScene(segue: segue)
    }
    
    func displayContacts(_ contacts: [User]) {
        self.selectedContacts = contacts
    }

    //Private methods and setups
    private func setup() {
        let createButton = UIBarButtonItem(title: "Готово",
                                           style: .done,
                                           target: self,
                                           action: #selector(createGroup))
        self.navigationItem.rightBarButtonItem = createButton
    }
    
    @objc private func createGroup() {
        presenter.createGroup()
    }
}

extension FinalStepNewGroupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return selectedContacts.count
        default:
            fatalError("Undefined section. Section: \(section)")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FinalGroupCell.identifier, for: indexPath) as? FinalGroupCell else {
                fatalError("The dequeued cell is not an instance of FinalGroupCell")
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FinalStepContactCell.identifier, for: indexPath) as? FinalStepContactCell else {
                fatalError("The dequeued cell is not an instance of FinalStepContactCell")
            }
            let first = selectedContacts[indexPath.row].firstName ?? ""
            let middle = selectedContacts[indexPath.row].middleName ?? ""
            let last = selectedContacts[indexPath.row].lastName ?? ""
            cell.contactName.text = first + " " + middle + " " + last
//            cell.contactPhoto.image = ??
            
            return cell
        default:
            fatalError("Undefined section. Section: \(indexPath.section)")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 90.0
        }
        return 50.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footerView = UILabel()
            footerView.text = footerSelectedContacts
            footerView.textAlignment = .center
            footerView.backgroundColor = footerColor
            return footerView
        } else {
            return UIView()
        }
    }
}

extension FinalStepNewGroupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            selectedContacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
