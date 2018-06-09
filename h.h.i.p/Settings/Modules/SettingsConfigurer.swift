//
//  SettingsConfigurer.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import Foundation

class SettingsConfigurer {
    
    static let sharedInstance = SettingsConfigurer()
    
    func configureCurrentChatView (viewController: SettingsViewController) {
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let router = SettingsRouter()
        let dataManager = ChatDataManager()
        
        router.viewController = viewController

        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.DataManager = dataManager
        
    }
    
}
