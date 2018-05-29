//
//  CurrentChatViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol CurrentChatViewControllerOutputProtocol: class {
    func saveSelectedChat(chat: Chat)
}

protocol CurrentChatViewControllerInputProtocol: class {
    func displayCurrentChat(chat: Chat)
}

class CurrentChatViewController: UIViewController, CurrentChatViewControllerInputProtocol {

    //MARK: Properties
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var inputMessageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var attachButton: UIButton!
    
    var chat: Chat?
    
    var presenter: CurrentChatViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        CurrentChatConfigurer.sharedInstance.configureCurrentChatView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func displayCurrentChat(chat: Chat) {
        self.chat = chat

    }
}

extension CurrentChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat?.messeges.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableCell.identifier, for: indexPath) as! MessageTableCell
        
        guard let message = chat?.messeges[indexPath.row] else {
            fatalError("Not found message for current chat. Chat: \(String(describing: chat?.description)), message: \(String(describing: chat?.messeges[indexPath.row].description))")
        }
        //TODO: сделать выборку для сообщений от пользователя и для сообщений от контакта..разделить цветом и разнести по сторонам
        cell.message.text = message.text
        
        return cell
    }
    
    
}
extension CurrentChatViewController: UITableViewDelegate {
    //TODO: подумать, что здесь можно замутить
}
