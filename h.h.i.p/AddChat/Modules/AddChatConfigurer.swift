//
//  AddChatConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 29.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class AddChatConfigurer {
    
    static let sharedInstance = AddChatConfigurer()
    
    func configureAddChatView (viewController: AddChatViewController) {
        
        let presenter = AddChatPresenter()
        let interactor = AddChatInteractor()
        let router = AddChatRouter()
        let data = ChatDataManager()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.DataManager = data
        
    }
}
