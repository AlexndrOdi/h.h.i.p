//
//  NewContactViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol NewContactViewControllerInputProtocol: class {
    
}

protocol NewContactViewControllerOutputProtocol: class {
    func pressDoneButton()
    func passDataToNextScene(segue: UIStoryboardSegue)
}

class NewContactViewController: UIViewController, UINavigationControllerDelegate, NewContactViewControllerInputProtocol {

    @IBOutlet weak var newContactPropertyTable: UITableView!
    var bottomConstraint: NSLayoutConstraint?
    
    var presenter: NewContactViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewContactConfigurer.sharedInstance.configureNewContactView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navigationTitleNewContact
        setup()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyBoardNotification), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        bottomConstraint = NSLayoutConstraint(item: newContactPropertyTable, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(bottomConstraint!)
    }
    
    //Private method for handle keyboard
    @objc func handleKeyBoardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let isKeyBoardShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            guard let keyBoardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
                fatalError("KeyboardFrame in newContactPropertyTable has some fatal error.")
            }
            bottomConstraint?.constant = isKeyBoardShowing ? -keyBoardFrame.height : 0
            
            //TODO: анимация с клавиатурой - переснити потом в анимэйшен
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: {(completed) in
                if isKeyBoardShowing {
                    if let indexPath = self.newContactPropertyTable.indexPathForSelectedRow {
                    self.newContactPropertyTable.scrollToRow(at: indexPath, at: .bottom, animated: true)
                    }
                }
            })
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        presenter.passDataToNextScene(segue: segue)
    }
    
    @objc func unwindToAddChatView() {
    
        presenter.pressDoneButton()
    }
    
    //Private methods and setup fun-s
    private func setup() {
        
        let doneButtone = UIBarButtonItem(title: "Готово",
                                          style: .done,
                                          target: self,
                                          action: #selector(unwindToAddChatView))
        navigationItem.rightBarButtonItem = doneButtone
    }
}

extension NewContactViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateContactCell.identifier, for: indexPath) as? CreateContactCell else {
            fatalError("The dequeued cell is not an instance of CreateContactCell")
        }
        switch indexPath.row {
        case 0:
            cell.inputField.placeholder = name
            cell.inputField.keyboardType = .default
        case 1:
            cell.inputField.placeholder = family
            cell.inputField.keyboardType = .default
        case 2:
            cell.inputField.placeholder = phoneNumber
            cell.inputField.keyboardType = .phonePad
        case 3:
            cell.inputField.placeholder = email
            cell.inputField.keyboardType = .emailAddress
        case 4:
            cell.inputField.placeholder = company
            cell.inputField.keyboardType = .default
        case 5:
            cell.inputField.placeholder = vacation
            cell.inputField.keyboardType = .default
        default:
            fatalError("Undefined cell at \(indexPath.row)")
        }
        return cell
    }
}
extension NewContactViewController: UITableViewDelegate {
    
}
