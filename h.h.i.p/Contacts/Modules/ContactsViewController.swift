//
//  ContactsViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 03.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit
import Alamofire
import SocketIO

struct TestConnect: Decodable, Modaleble {
    var text: String
}

protocol ContactsViewControllerInputProtocol: class {
    func updateFields(debug: String, event: String)
}

protocol ContactsViewControllerOutputProtocol: class {
    func fetchAllContacts()
}

class ContactsViewController: UIViewController, UITextViewDelegate, ContactsViewControllerInputProtocol {
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var debugField: UITextView!
    @IBOutlet weak var anyHandlerField: UITextView!
    
    @IBOutlet weak var button: UIButton!
    var presenter: ContactsViewControllerOutputProtocol!
    
    let urlReq = "http://195.133.144.75:80"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateFields(debug: String, event: String) {
        debugField.text.append(debug + "\n")
        anyHandlerField.text.append(event + "\n")
        debugField.reloadInputViews()
        anyHandlerField.reloadInputViews()
        
        let rangeAny = NSMakeRange(anyHandlerField.text.characters.count - 1, 1)
        let rangeDebug = NSMakeRange(debugField.text.characters.count - 1, 1)
        debugField.scrollRangeToVisible(rangeDebug)
        anyHandlerField.scrollRangeToVisible(rangeAny)
    }

        

    
    
    
    
    
    
    
    
    
    
    
    @IBAction func sendData(_ sender: UIButton) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = navigationTitleContacts
        ContactsConfigurer.sharedInstance.configureContactsView(viewController: self)
        
        
//        performAllContacts()
    }
    
    func performAllContacts() {
        presenter.fetchAllContacts()
    }
}

//extension ContactsViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    
//}
//extension ContactsViewController: UITableViewDelegate {
//    
//}
