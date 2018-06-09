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

protocol ContactsViewControllerInputProtocol: class {
    
}

protocol ContactsViewControllerOutputProtocol: class {
    func fetchAllContacts()
}

class ContactsViewController: UIViewController, ContactsViewControllerInputProtocol {
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    @IBOutlet weak var button: UIButton!
    var presenter: ContactsViewControllerOutputProtocol!
    
    let urlReq = "http://195.133.144.75:80"
    
    @IBAction func sendData(_ sender: UIButton) {
            
//        Alamofire.request(urlReq, method: .get , parameters: ["foo": "bar"], encoding: JSONEncoding.default, headers: nil).validate()
//            .responseJSON { (response) in
//                switch response.result {
//                case .failure(let err):
//                    print(err.localizedDescription)
//                    print(err)
//                case .success:
//                    print(response)
//                }

//        let socketConfiguration: SocketIOClientConfiguration = [.log(true),
//                                                                .secure(false)]
//
//        let manager = SocketManager(socketURL: URL(string: baseSocketUrl)!, config: socketConfiguration)
//        let socket = manager.defaultSocket
//
//        socket.connect(timeoutAfter: 15.0) {
//            print("connected")
//        }
//
//        socket.onAny { (event) in
//            print(event.description)
//            print("---------------")
//            print(event.event)
//            print("---------------")
//            print(event.items?.count)
//            print("---------------")
//            print(event.items?.first)
//        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = navigationTitleContacts
        
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
