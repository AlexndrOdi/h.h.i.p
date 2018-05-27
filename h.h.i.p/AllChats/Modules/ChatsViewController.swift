//
//  ChatsViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol ChatsViewControllerOutputProtocol: class {
    //TODO: протокольное общение от контроллера к интерактору
    func fetchAllChats()
    func navigateToChatDetail()
}

protocol ChatsViewControllerInputProtocol: class {
    //TODO: протокольное общение от презентера к контроллеру
    func displayFetchedChats(chats: [Chat])
    func showError(errorMessage: String)
    func showWaitingView()
    func hideWaitingView()
}

class ChatsViewController: UIViewController, UINavigationControllerDelegate, ChatsViewControllerInputProtocol {
    
    //MARK: Properties
    @IBOutlet weak var tableChatsView: UITableView!
    
    var chats: [Chat] = []
    
    var presenter: ChatsViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ChatsConfigurer.sharedInstance.configureChatsView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        performAllChats()
    }

    func performAllChats() {
        presenter.fetchAllChats()
    }
    
    //Show fetched chats
    func displayFetchedChats(chats: [Chat]) {
        self.chats.append(contentsOf: chats)

        DispatchQueue.main.async {
            self.tableChatsView.reloadData()
        }
    }
    //Show error
    func showError(errorMessage: String) {
        let refreshAlert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            refreshAlert.dismiss(animated: true, completion: nil)
            }))
        present(refreshAlert, animated: true, completion: nil)
    }
    //Activity indicator view
    func showWaitingView() {
//
//        let alert = UIAlertController(title: "Waiting..", message: nil, preferredStyle: .alert)
//        alert.view.isOpaque = true
        
        let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        
//        alert.view.addSubview(loadingIndicator)
        
        self.navigationController?.present(self, animated: true, completion: nil)
        
    }
    func hideWaitingView() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ChatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: сделать для случая, когда текущих чатов меньше, чем всего
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: добавить лоадинг селл, если чатов в кэше нет больше
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.identifier, for: indexPath) as! ChatCell
        
        //TODO: после добавления кэша сделать рефаторинг и реорганизовать
        let chat = self.chats[indexPath.row]
//        cell.imageContactView.image = chat.image
        cell.labelContactName.text = chat.users.first?.firstName
        cell.textLastMessageField.text = chat.messeges.last?.text
        
        return cell
    }
}
extension ChatsViewController: UITableViewDelegate {
    
    //TODO: дописать после настройки роутинга
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.navigateToChatDetail()
    }
}





