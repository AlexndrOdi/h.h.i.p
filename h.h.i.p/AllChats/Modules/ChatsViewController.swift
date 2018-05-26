//
//  ChatsViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 25.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol ChatsViewControllerOutputProtocol {
    //TODO: протокольное общение от контроллера к интерактору
    func fetchAllChats()
}

class ChatsViewController: UIViewController {
    
    var presenter: ChatsViewControllerOutputProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ChatsConfigurer.sharedInstance.configureChatsView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func performAllChats() {
        presenter.fetchAllChats()
    }
}
