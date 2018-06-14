//
//  CurrentChatConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 28.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class CurrentChatConfigurer {
    
    static let sharedInstance = CurrentChatConfigurer()
    
    func configureCurrentChatView (viewController: CurrentChatViewController) {
        let presenter = CurrentChatPresenter()
        let interactor = CurrentChatInteractor()
        let router = CurrentChatRouter()
        let dataManager = ChatDataManager()
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.DataManager = dataManager
    }
}
